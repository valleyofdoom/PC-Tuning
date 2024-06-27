param(
    [string]$get_option_keys,
    [int]$windows_build,
    [switch]$entries_json
)

$entries = @{
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\EOSNotify"                                                                 = @{
        "DiscontinueEOS" = @{
            "max_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable PC is out of support message")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"                                                                  = @{
        "WUServer"                        = @{
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        "WUStatusServer"                  = @{
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        "UpdateServiceUrlAlternate"       = @{
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        "DisableWindowsUpdateAccess"      = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows update")
        }
        "DisableOSUpgrade"                = @{
            "min_version" = 9200
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
        "SetDisableUXWUAccess"            = @{
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
        "ExcludeWUDriversInQualityUpdate" = @{
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"                                                               = @{
        "NoAutoUpdate" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable automatic windows updates"
            )
        }
        "UseWUServer"  = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows update")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update"                                                = @{
        # not the same as "Configure Automatic Updates" policy. this key seems to be exclusive to Windows 7/8
        "AUOptions"                  = @{
            "max_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
        "SetupWizardLaunchTime"      = @{
            "max_version" = 9600
            "type"        = "REG_DELETE"
            "apply_if"    = @("disable windows update")
        }
        "AcceleratedInstallRequired" = @{
            "max_version" = 9600
            "type"        = "REG_DELETE"
            "apply_if"    = @("disable windows update")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching"                                                          = @{
        "SearchOrderConfig" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata"                                                          = @{
        "PreventDeviceMetadataFromNetwork" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching"                                                                = @{
        "SearchOrderConfig"       = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
        "DontSearchWindowsUpdate" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"                                                                       = @{
        "ExcludeWUDriversInQualityUpdate" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"                                                          = @{
        "EnableLUA"                     = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable user account control")
        }
        "DisableAutomaticRestartSignOn" = @{
            "min_version" = 18362
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable sign-in and lock last interactive user after a restart")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance"                                                  = @{
        "MaintenanceDisabled" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable automatic maintenance")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments"                                                      = @{
        "SaveZoneInformation" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows marking file attachments with information about their zone of origin"
            )
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\AppCompat"                                                                       = @{
        "DisablePCA" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable program compatibility assistant")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient\Windows"                                                                               = @{
        "CEIPEnable" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows"                                                                      = @{
        "CEIPEnable" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM"                                                                   = @{
        "OptIn" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\FTH"                                                                                             = @{
        "Enabled" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable fault tolerant heap")
        }
    }
    "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys"                                                                              = @{
        "Flags" = @{
            "value"    = "506"
            "type"     = "REG_SZ"
            "apply_if" = @("disable sticky keys")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender"                                                                       = @{
        "DisableAntiSpyware" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection"                                             = @{
        "DisableScanOnRealtimeEnable" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
        "DisableOnAccessProtection"   = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"                                                  = @{
        "DisableScanOnRealtimeEnable" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
        "DisableBehaviorMonitoring"   = @{
            "min_version" = 9200
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend"                                                                        = @{
        "Start" = @{
            "value"    = 4
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc"                                                                           = @{
        "Start" = @{
            "value"    = 4
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"                                                       = @{
        "POWERSHELL_TELEMETRY_OPTOUT" = @{
            "value"    = "1"
            "type"     = "REG_SZ"
            "apply_if" = @("disable telemetry")
        }
    }
    "HKEY_CURRENT_USER\Control Panel\Mouse"                                                                                                 = @{
        "MouseSpeed"      = @{
            "value"    = "0"
            "type"     = "REG_SZ"
            "apply_if" = @("disable pointer acceleration")
        }
        "MouseThreshold1" = @{
            "value"    = "0"
            "type"     = "REG_SZ"
            "apply_if" = @("disable pointer acceleration")
        }
        "MouseThreshold2" = @{
            "value"    = "0"
            "type"     = "REG_SZ"
            "apply_if" = @("disable pointer acceleration")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power"                                                             = @{
        "HiberbootEnabled" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable fast startup")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting"                                                                = @{
        "DoReport" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows error reporting")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting"                                                        = @{
        "Disabled" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows error reporting")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance"                                                                 = @{
        "fAllowToGetHelp" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable remote assistance")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"                                                         = @{
        "HideFileExt" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("show file extensions")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter"                                                                         = @{
        "Start" = @{
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot"                                                                           = @{
        "Start" = @{
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc"                                                                         = @{
        "Start" = @{
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv"                                                                         = @{
        "Start" = @{
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"                                                                 = @{
        "ConnectedSearchUseWeb" = @{
            "min_version" = 9600
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable search the web or display web results in search")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"                                               = @{
        "NoCloudApplicationNotification" = @{
            "min_version" = 9200
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable notifications network usage")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService"                                                            = @{
        "Start" = @{
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense"                                                                            = @{
        "Start" = @{
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"                                                                      = @{
        "SecurityHealth"  = @{
            "min_version" = 10240
            "type"        = "REG_DELETE"
            "apply_if"    = @("disable windows defender")
        }
        "WindowsDefender" = @{
            "min_version" = 10240
            "type"        = "REG_DELETE"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity"                             = @{
        "Enabled" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet"                                                                         = @{
        "SpyNetReporting"      = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
        "SubmitSamplesConsent" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"                                                                 = @{
        "SmartScreenEnabled" = @{
            "min_version" = 10240
            "value"       = "Off"
            "type"        = "REG_SZ"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost"                                                                   = @{
        "EnableWebContentEvaluation" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled"                                                                          = @{
        "@" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" = @{
        "ActivationType" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable gamebarpresencewriter")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack"                                                                        = @{
        "Start" = @{
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection"                                                                 = @{
        "AllowTelemetry" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"                                                        = @{
        "AllowOnlineTips" = @{
            "min_version" = 16299
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @(
                "disable retrieval of online tips and help in the immersive control panel"
            )
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\input\Settings"                                                                                   = @{
        "InsightsEnabled" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable typing insights")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"                                                                     = @{
        "LetAppsRunInBackground" = @{
            "min_version" = 10240
            "value"       = 2
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable background apps")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings"                                                            = @{
        "IsDynamicSearchBoxEnabled" = @{
            "min_version" = 22000
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable suggestions in the search box and in search home")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WTDS\Components"                                                          = @{
        "ServiceEnabled" = @{
            "min_version" = 22000
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy"                                                                         = @{
        "VerifiedAndReputablePolicyState" = @{
            "min_version" = 22000
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT"                                                                                    = @{
        "DontOfferThroughWUAU" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable malicious software removal tool updates")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh"                                                                                    = @{
        "AllowNewsAndInterests" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable widgets")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"                                                        = @{
        "EnableTransparency" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable transparency effects")
        }
    }
}

function Is-Admin() {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Apply-Registry($filePath) {
    if (-not (Test-Path $filePath)) {
        return 1
    }

    # unused for now
    $userMergeResult = (Start-Process "reg.exe" -ArgumentList "import $($filePath)" -PassThru -Wait -WindowStyle Hidden).ExitCode
    $trustedinstallerMergeResult = [int](.\MinSudo.exe --NoLogo --TrustedInstaller --Privileged cmd /c "reg import $($filePath) > nul 2>&1 && echo 0 || echo 1")

    # we only need to check whether TI merge fails as user merge is an attempt to merge user keys
    if ($trustedinstallerMergeResult -ne 0) {
        return 1
    }

    return 0
}

function Get-Option-Keys($optionName, $windowsBuild) {
    foreach ($path in $entries.Keys) {
        foreach ($keyName in $entries[$path].Keys) {
            $key = $entries[$path][$keyName]

            # unspecified versions implies that they key should be applied to all versions
            $minVersion = if ($key.Contains("min_version")) { $key["min_version"] } else { $windowsBuild }
            $maxVersion = if ($key.Contains("max_version")) { $key["max_version"] } else { $windowsBuild }

            # check if key meets the version criteria
            $isWinverSupported = $windowsBuild -ge $minVersion -and $windowsBuild -le $maxVersion

            # check if registry key is associated with option
            $isKeyAssociated = $key["apply_if"].Contains($optionName)

            if ($isWinverSupported -and $isKeyAssociated) {
                Write-Host "$($path)`n    $(if ($keyName -eq "@") { "Default" } else { $keyName } ) $($key["type"]) $($key["value"])`n"
            }
        }
    }
}

function main() {
    if ($entries_json) {
        Write-Host ($entries | ConvertTo-Json -Depth 100 -Compress)
        return 0
    }

    $windowsBuild = if ($windows_build) { $windows_build } else { [System.Environment]::OSVersion.Version.Build }

    # manually get windows build based on build version
    switch ($windowsBuild) {
        { $_ -ge 22000 } { $majorBuild = 11; break }
        { $_ -ge 10240 } { $majorBuild = 10; break }
        { $_ -ge 9600 } { $majorBuild = 8.1; break }
        { $_ -ge 9200 } { $majorBuild = 8; break }
        { $_ -ge 7600 } { $majorBuild = 7; break }
        default {
            Write-Host "error: unrecognized windows build $($windowsBuild)"
            return 1
        }
    }

    if ($get_option_keys) {
        # all option names are in lower case
        $get_option_keys = $get_option_keys.ToLower()

        Write-Host "info: showing entries associated with option `"$($get_option_keys)`" on windows $($majorBuild)`n"

        Get-Option-Keys -optionName $get_option_keys -windowsBuild $windowsBuild
        return 0
    }

    if (-not (Is-Admin)) {
        Write-Host "error: administrator privileges required"
        return 1
    }

    Set-Location $PSScriptRoot

    if (-not (Test-Path "registry-options.json")) {
        Write-Host "error: registry-options.json not found"
        return 1
    }

    if (-not (Test-Path "MinSudo.exe")) {
        Write-Host "error: MinSudo.exe not found in current directory"
        return 1
    }

    # contains keys to apply after all version filtering and config validation
    $filteredEntries = @{}

    $config = Get-Content -Path "registry-options.json" -Raw | ConvertFrom-Json

    # track seen options to find unrecognized options in registry-options.json
    $seenOptions = New-Object System.Collections.Generic.HashSet[string]
    $undefinedOptions = New-Object System.Collections.Generic.HashSet[string]

    Write-Host "info: parsing config"

    foreach ($path in $entries.Keys) {
        foreach ($keyName in $entries[$path].Keys) {
            $key = $entries[$path][$keyName]

            $isUserApplyKey = $false

            foreach ($applyIfOption in $key["apply_if"]) {
                # add option to set in order to keep track of what options have been seen so far
                $seenOptions.Add($applyIfOption)

                # check if option is in registry-options.json
                $isOptionInConfig = $config.options.PSObject.Properties.Match($applyIfOption).Count -gt 0

                if ($isOptionInConfig) {
                    if ($config.options.$applyIfOption) {
                        $isUserApplyKey = $true
                    }
                } else {
                    $undefinedOptions.Add($applyIfOption)
                }
            }

            # unspecified versions implies that they key should be applied to all versions
            $minVersion = if ($key.Contains("min_version")) { $key["min_version"] } else { $windowsBuild }
            $maxVersion = if ($key.Contains("max_version")) { $key["max_version"] } else { $windowsBuild }

            # check if key meets the version criteria
            $isWinverSupported = $windowsBuild -ge $minVersion -and $windowsBuild -le $maxVersion

            if ($isUserApplyKey -and $isWinverSupported) {
                # initialize path if it doesn't exist
                if (-not $filteredEntries.Contains($path)) {
                    $filteredEntries.Add($path, @{})
                }

                $filteredEntries[$path].Add($keyName, $key)
            }
        }
    }

    $configErrors = 0

    foreach ($option in $undefinedOptions) {
        Write-Host "error: `"$($option)`" option missing in config"
        $configErrors++
    }

    foreach ($option in $config.options.PSObject.Properties) {
        if (-not ($seenOptions.Contains($option.Name))) {
            Write-Host "error: `"$($option.Name)`" unrecognized in config"
            $configErrors++
        }
    }

    if ($configErrors -gt 0) {
        Write-Host "error: resolve $($configErrors) errors in config"
        return 1
    }

    Write-Host "info: creating registry file"

    $hasError = $false
    $registryFile = "$($env:TEMP)\tmp.reg"

    # registry file header and clear previous contents
    Set-Content -Path $registryFile -Value "Windows Registry Editor Version 5.00`n"

    foreach ($path in $filteredEntries.Keys) {
        Add-Content -Path $registryFile -Value "[$($path)]"

        foreach ($keyName in $filteredEntries[$path].Keys) {
            $key = $filteredEntries[$path][$keyName]

            # default key does not have extra quotes
            if ($keyName -eq "@") {
                $line = "@"
            } else {
                $line = "`"$($keyName)`""
            }

            switch ($key["type"]) {
                "REG_DWORD" {
                    $hexValue = "{0:X8}" -f $key["value"]
                    $line += "=dword:$($hexValue)"
                }
                "REG_SZ" {
                    $line += "=`"$($key["value"])`""
                }
                "REG_DELETE" {
                    $line += "=-"
                }
                default {
                    Write-Host "error: unrecognized type $($key["type"]) for key $($keyName)"
                    $hasError = $true
                }
            }

            Add-Content -Path $registryFile -Value $line
        }

        # new line between paths
        Add-Content -Path $registryFile -Value ""
    }

    if ($hasError) {
        return 1
    }

    $mergeResult = Apply-Registry -filePath $registryFile

    Write-Host "$(if ($mergeResult -ne 0) { "error: failed" } else { "info: succeeded" }) merging registry settings for windows $($majorBuild)"
    return $mergeResult
}

$_exitCode = main
Write-Host # new line
exit $_exitCode
