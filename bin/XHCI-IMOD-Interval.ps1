param(
    [switch]$verbose
)

# The variables starting with $GLOBAL store values that should be applied to all XHCI controllers by default.
# To override this default value on a per-controller basis, specify the DEV_XXXX hardware ID value for the XHCI controller along with its data
# See the example below.
#
#    $globalInterval = 0x0
#    $globalHCSPARAMSOffset = 0x4
#    $globalRTSOFF = 0x18
#
#    $userDefinedData = @{
#        "DEV_8A4D" = @{
#            "INTERVAL"         = 0xFFFF
#            "HCSPARAPS_OFFSET" = 0x8
#            "RTSOFF"           = 0x12
#        }
#        "DEV_4AC6" = @{
#            "INTERVAL" = 0xFA00
#        }
#    }
#
# In this example, the IMOD interval, HCSPARAMS and RTSOFF offsets for all controllers will be treated as 0x0, 0x4 and 0x18 respectively.
# However, the IMOD interval, HCSPARAMS and RTSOFF offsets for the DEV_8A4D XHCI controller will override the global values and will be treated
# as 0xFFFF, 0x8, 0x12 respectively. similarly with the DEV_4AC6 XHCI controller, only the IMOD interval will be overridden (0xFA00). The global
# values will be used for each field that is not specified they are optional.
#
# https://github.com/valleyofdoom/PC-Tuning/blob/main/bin/XHCI-IMOD-Interval.ps1
#

$globalInterval = 0x0
# common offsets across XHCI vendors that will work with most XHCI controllers
$globalHCSPARAMSOffset = 0x4
$globalRTSOFF = 0x18

$userDefinedData = @{}

# specify the path to Rw.exe
$rwePath = "C:\Program Files\RW-Everything\Rw.exe"

function Dec-To-Hex($decimal) {
    $hexValue = $decimal.ToString("X2")
    return "0x$($hexValue)"
}

function Get-Value-From-Address($address) {
    # convert the hex value to string for RWE
    $address = Dec-To-Hex -decimal ([uint64]$address)

    $stdout = & $rwePath /Min /NoLogo /Stdout /Command="R32 $($address)" | Out-String
    $splitString = $stdout -split " "
    return [uint64]$splitString[-1]
}

function Get-Device-Addresses() {
    $data = @{}
    $resources = Get-WmiObject -Class Win32_PNPAllocatedResource -ComputerName LocalHost -Namespace root\CIMV2

    foreach ($resource in $resources) {
        $deviceId = $resource.Dependent.Split("=")[1].Replace('"', '').Replace("\\", "\")
        $physicalAddress = $resource.Antecedent.Split("=")[1].Replace('"', '')

        if (-not $data.ContainsKey($deviceId) -and $deviceId -and $physicalAddress) {
            $data[$deviceId] = [uint64]$physicalAddress
        }
    }

    return $data
}

function Is-Admin() {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function main() {
    if (-not (Is-Admin)) {
        Write-Host "error: administrator privileges required"
        return 1
    }

    if (-not (Test-Path $rwePath -PathType Leaf)) {
        Write-Host "error: $($rwePath) not exists, edit the script to change the path to Rw.exe"
        Write-Host "http://rweverything.com/download"
        return 1
    }

    # CLI will not work if Rw is already open
    Stop-Process -Name "Rw" -ErrorAction SilentlyContinue

    # get physical address of each device present in the system
    $deviceMap = Get-Device-Addresses

    foreach ($xhciController in Get-WmiObject Win32_USBController) {
        $isDisabled = $xhciController.ConfigManagerErrorCode -eq 22

        if ($isDisabled) {
            continue
        }

        $deviceId = $xhciController.DeviceID

        Write-Host "$($xhciController.Caption) - $($deviceId)"

        # skip if entry is null
        if (-not $deviceMap.Contains($deviceId)) {
            Write-Host "error: could not obtain base address`n"
            continue
        }

        $desiredInterval = $globalInterval
        $hcsparamsOffset = $globalHCSPARAMSOffset
        $rtsoff = $globalRTSOFF

        foreach ($hwid in $userDefinedData.Keys) {
            if ($deviceId -match $hwid) {
                $userDefinedController = $userDefinedData[$hwid]

                if ($userDefinedController.ContainsKey("INTERVAL")) {
                    $desiredInterval = $userDefinedController["INTERVAL"]
                }

                if ($userDefinedController.ContainsKey("HCSPARAPS_OFFSET")) {
                    $hcsparamsOffset = $userDefinedController["HCSPARAPS_OFFSET"]
                }

                if ($userDefinedController.ContainsKey("RTSOFF")) {
                    $rtsoff = $userDefinedController["RTSOFF"]
                }
            }
        }

        $capabilityAddress = $deviceMap[$deviceId]
        $HCSPARAMSValue = Get-Value-From-Address -address ($capabilityAddress + $hcsparamsOffset)
        $HCSPARAMSBitmask = [Convert]::ToString($HCSPARAMSValue, 2)
        $maxIntrs = [Convert]::ToInt32($HCSPARAMSBitmask.Substring($HCSPARAMSBitmask.Length - 16, 8), 2)
        $RTSOFFValue = Get-Value-From-Address -address ($capabilityAddress + $rtsoff)
        $runtimeAddress = $capabilityAddress + $RTSOFFValue

        if ($verbose) {
            $formattedCapabilityAddress = Dec-To-Hex -decimal $capabilityAddress
            $formattedRTSOFFValue = Dec-To-Hex -decimal $RTSOFFValue

            Write-Host "capability_address  = $($formattedCapabilityAddress)"
            Write-Host "HCSPARAMS_value     = capability_address + hcsparams_offset = $($formattedCapabilityAddress) + $(Dec-To-Hex -decimal $hcsparamsOffset) = $(Dec-To-Hex -decimal $HCSPARAMSValue)"
            Write-Host "HCSPARAMS_bitmask   = $($HCSPARAMSBitmask)"
            Write-Host "max_intrs           = $($maxIntrs)"
            Write-Host "RTSOFF_value        = capability_address + rtsoff = $($formattedCapabilityAddress) + $(Dec-To-Hex -decimal $rtsoff) = $($formattedRTSOFFValue)"
            Write-Host "runtime_address     = capability_address + RTSOFF_value = $($formattedCapabilityAddress) + $($formattedRTSOFFValue) = $(Dec-To-Hex -decimal $runtimeAddress)"
        }

        for ($i = 0; $i -lt $maxIntrs; $i++) {
            # calculate address and convert address to hex string
            $interrupterAddress = Dec-To-Hex -decimal ([uint64]($runtimeAddress + 0x24 + (0x20 * $i)))

            if ($verbose) {
                Write-Host "`ninterrupter_address = runtime_address + 0x24 + (0x20 * index) = $(Dec-To-Hex -decimal $runtimeAddress) + 0x24 + (0x20 * $($i)) = $($interrupterAddress)"
                Write-Host "Write DWORD = $(Dec-To-Hex -decimal $desiredInterval)"
            }

            & $rwePath /Min /NoLogo /Stdout /Command="W32 $($interrupterAddress) $($desiredInterval)" | Write-Host
        }

        Write-Host # new line
    }

    return 0
}

$_exitCode = main
Write-Host # new line
exit $_exitCode
