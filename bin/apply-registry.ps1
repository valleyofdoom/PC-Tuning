param(
    [string]$get_option_keys,
    [int]$windows_build,
    [switch]$build_docs
)

$entries = @{
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\EOSNotify"                                                                 = @(
        @{
            "key_name"    = "DiscontinueEOS"
            "max_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable computer is out of support message")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"                                                                  = @(
        @{
            "key_name" = "WUServer"
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        @{
            "key_name" = "WUStatusServer"
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        @{
            "key_name" = "UpdateServiceUrlAlternate"
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        @{
            "key_name" = "DisableWindowsUpdateAccess"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows update")
        }
        @{
            "key_name"    = "DisableOSUpgrade"
            "min_version" = 9200
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
        @{
            "key_name"    = "SetDisableUXWUAccess"
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
        @{
            "key_name"    = "ExcludeWUDriversInQualityUpdate"
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
        @{
            "key_name"    = "DoNotConnectToWindowsUpdateInternetLocations"
            "min_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"                                                               = @(
        @{
            "key_name" = "NoAutoUpdate"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable automatic windows updates"
            )
        }
        @{
            "key_name" = "UseWUServer"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows update")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update"                                                = @(
        @{
            # not the same as "Configure Automatic Updates" policy. this key seems to be exclusive to Windows 7/8
            "key_name"    = "AUOptions"
            "max_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
        @{
            "key_name"    = "SetupWizardLaunchTime"
            "max_version" = 9600
            "type"        = "REG_DELETE"
            "apply_if"    = @("disable windows update")
        }
        @{
            "key_name"    = "AcceleratedInstallRequired"
            "max_version" = 9600
            "type"        = "REG_DELETE"
            "apply_if"    = @("disable windows update")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching"                                                          = @(
        @{
            "key_name" = "SearchOrderConfig"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata"                                                          = @(
        @{
            "key_name" = "PreventDeviceMetadataFromNetwork"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching"                                                                = @(
        @{
            "key_name" = "SearchOrderConfig"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
        @{
            "key_name" = "DontSearchWindowsUpdate"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"                                                                       = @(
        @{
            "key_name" = "ExcludeWUDriversInQualityUpdate"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"                                                          = @(
        @{
            "key_name"    = "DisableAutomaticRestartSignOn"
            "min_version" = 18362
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable sign-in and lock last interactive user after a restart")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance"                                                  = @(
        @{
            "key_name" = "MaintenanceDisabled"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable automatic maintenance")
        }
    )
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments"                                                      = @(
        @{
            "key_name" = "SaveZoneInformation"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows marking file attachments with information about their zone of origin"
            )
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient\Windows"                                                                               = @(
        @{
            "key_name" = "CEIPEnable"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows"                                                                      = @(
        @{
            "key_name" = "CEIPEnable"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM"                                                                   = @(
        @{
            "key_name" = "OptIn"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client"                                                                       = @(
        @{
            "key_name" = "CEIP"
            "value"    = 2
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    )
    "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys"                                                                              = @(
        @{
            "key_name" = "Flags"
            "value"    = "506"
            "type"     = "REG_SZ"
            "apply_if" = @("disable sticky keys")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender"                                                                       = @(
        @{
            "key_name" = "DisableAntiSpyware"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection"                                             = @(
        @{
            "key_name" = "DisableScanOnRealtimeEnable"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
        @{
            "key_name" = "DisableOnAccessProtection"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"                                                  = @(
        @{
            "key_name" = "DisableScanOnRealtimeEnable"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
        @{
            "key_name"    = "DisableBehaviorMonitoring"
            "min_version" = 9200
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend"                                                                        = @(
        @{
            "key_name" = "Start"
            "value"    = 4
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MsSecCore"                                                                        = @(
        @{
            "key_name"    = "Start"
            "min_version" = 22000
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc"                                                                           = @(
        @{
            "key_name" = "Start"
            "value"    = 4
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"                                                       = @(
        @{
            "key_name" = "POWERSHELL_TELEMETRY_OPTOUT"
            "value"    = "1"
            "type"     = "REG_SZ"
            "apply_if" = @("disable telemetry")
        }
    )
    "HKEY_CURRENT_USER\Control Panel\Mouse"                                                                                                 = @(
        @{
            "key_name" = "MouseSpeed"
            "value"    = "0"
            "type"     = "REG_SZ"
            "apply_if" = @("disable pointer acceleration")
        }
        @{
            "key_name" = "MouseThreshold1"
            "value"    = "0"
            "type"     = "REG_SZ"
            "apply_if" = @("disable pointer acceleration")
        }
        @{
            "key_name" = "MouseThreshold2"
            "value"    = "0"
            "type"     = "REG_SZ"
            "apply_if" = @("disable pointer acceleration")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power"                                                             = @(
        @{
            "key_name" = "HiberbootEnabled"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable fast startup")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting"                                                                = @(
        @{
            "key_name" = "DoReport"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows error reporting")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent"                                                = @(
        @{
            "key_name"    = "DefaultConsent"
            "max_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows error reporting")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting"                                                        = @(
        @{
            "key_name" = "Disabled"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows error reporting")
        }

    )
    "HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting"                                                                  = @(
        @{
            "key_name" = "DontSendAdditionalData"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows error reporting")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance"                                                                 = @(
        @{
            "key_name" = "fAllowToGetHelp"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable remote assistance")
        }
    )
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"                                                         = @(
        @{
            "key_name" = "HideFileExt"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("show file extensions")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter"                                                                         = @(
        @{
            "key_name"    = "Start"
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot"                                                                           = @(
        @{
            "key_name"    = "Start"
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc"                                                                         = @(
        @{
            "key_name"    = "Start"
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv"                                                                         = @(
        @{
            "key_name"    = "Start"
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"                                                                 = @(
        @{
            "key_name"    = "AllowCortana"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("mitigate web-based search info")
        }
        @{
            "key_name"    = "ConnectedSearchUseWeb"
            "min_version" = 9600
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("mitigate web-based search info")
        }
        @{
            "key_name"    = "ConnectedSearchPrivacy"
            "min_version" = 9600
            "max_version" = 9600
            "value"       = 3
            "type"        = "REG_DWORD"
            "apply_if"    = @("mitigate web-based search info")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"                                               = @(
        @{
            "key_name"    = "NoCloudApplicationNotification"
            "min_version" = 9200
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable notifications network usage")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService"                                                            = @(
        @{
            "key_name"    = "Start"
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense"                                                                            = @(
        @{
            "key_name"    = "Start"
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"                                                                      = @(
        @{
            "key_name"    = "SecurityHealth"
            "min_version" = 10240
            "type"        = "REG_DELETE"
            "apply_if"    = @("disable windows defender")
        }
        @{
            "key_name"    = "WindowsDefender"
            "min_version" = 10240
            "type"        = "REG_DELETE"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity"                             = @(
        @{
            "key_name"    = "Enabled"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet"                                                                         = @(
        @{
            "key_name"    = "SpyNetReporting"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
        @{
            "key_name"    = "SubmitSamplesConsent"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"                                                                 = @(
        @{
            "key_name"    = "SmartScreenEnabled"
            "min_version" = 10240
            "value"       = "Off"
            "type"        = "REG_SZ"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost"                                                                   = @(
        @{
            "key_name"    = "EnableWebContentEvaluation"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled"                                                                          = @(
        @{
            "key_name"    = "@"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" = @(
        @{
            "key_name"    = "ActivationType"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable gamebarpresencewriter")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack"                                                                        = @(
        @{
            "key_name"    = "Start"
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection"                                                                 = @(
        @{
            "key_name"    = "AllowTelemetry"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
        @{
            "key_name"    = "LimitDiagnosticLogCollection"
            "min_version" = 18363
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
        @{
            "key_name"    = "LimitDumpCollection"
            "min_version" = 18363
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
        @{
            "key_name"    = "LimitEnhancedDiagnosticDataWindowsAnalytics"
            "min_version" = 16299
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
        @{
            "key_name"    = "DoNotShowFeedbackNotifications"
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"                                                        = @(
        @{
            "key_name"    = "AllowOnlineTips"
            "min_version" = 16299
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @(
                "disable retrieval of online tips and help in the immersive control panel"
            )
        }
        @{
            "key_name" = "NoDriveTypeAutoRun"
            "value"    = 255
            "type"     = "REG_DWORD"
            "apply_if" = @("disable autoplay")
        }
        @{
            "key_name" = "NoAutorun"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable autoplay")
        }
    )
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\input\Settings"                                                                                   = @(
        @{
            "key_name"    = "InsightsEnabled"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable typing insights")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"                                                                     = @(
        @{
            "key_name"    = "LetAppsRunInBackground"
            "min_version" = 10240
            "value"       = 2
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable background apps")
        }
    )
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings"                                                            = @(
        @{
            "key_name"    = "IsDynamicSearchBoxEnabled"
            "min_version" = 22000
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable suggestions in the search box and in search home")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WTDS\Components"                                                          = @(
        @{
            "key_name"    = "ServiceEnabled"
            "min_version" = 22000
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy"                                                                         = @(
        @{
            "key_name"    = "VerifiedAndReputablePolicyState"
            "min_version" = 22000
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT"                                                                                    = @(
        @{
            "key_name" = "DontOfferThroughWUAU"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable malicious software removal tool updates")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh"                                                                                    = @(
        @{
            "key_name"    = "AllowNewsAndInterests"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable widgets")
        }
    )
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"                                                        = @(
        @{
            "key_name"    = "EnableTransparency"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable transparency effects")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore"                                                                           = @(
        @{
            "key_name"    = "AutoDownload"
            "min_version" = 9600
            "value"       = 2
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable automatic store app updates")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System"                                                                         = @(
        @{
            "key_name"    = "AllowClipboardHistory"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable clipboard history")
        }
        @{
            "key_name"    = "AllowCrossDeviceClipboard"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable clipboard history")
        }
        @{
            "key_name"    = "EnableActivityFeed"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable activity feed")
        }
        @{
            "key_name"    = "PublishUserActivities"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable activity feed")
        }
        @{
            "key_name"    = "UploadUserActivities"
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable activity feed")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"                                                                = @(
        @{
            "key_name"    = "DisabledByGroupPolicy"
            "min_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable advertising id")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer"                                                                       = @(
        @{
            "key_name" = "NoAutoplayfornonVolume"
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable autoplay")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"                                                                   = @(
        @{
            "key_name"    = "DisableCloudOptimizedContent"
            "min_version" = 18363
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable cloud content")
        }
        @{
            "key_name"    = "DisableConsumerAccountStateContent"
            "min_version" = 18363
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable cloud content")
        }
        @{
            "key_name"    = "DisableSoftLanding"
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable cloud content")
        }
        @{
            "key_name"    = "DisableWindowsConsumerFeatures"
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable cloud content")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput"                                                       = @(
        @{
            "key_name"    = "AllowLinguisticDataCollection"
            "min_version" = 17134
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable sending inking and typing data to microsoft")
        }
    )
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\FTH"                                                                                             = @(
        @{
            "key_name" = "Enabled"
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable fault tolerant heap")
        }
    )
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
        foreach ($key in $entries[$path]) {
            # unspecified versions implies that they key should be applied to all versions
            $minVersion = if ($key.Contains("min_version")) { $key["min_version"] } else { $windowsBuild }
            $maxVersion = if ($key.Contains("max_version")) { $key["max_version"] } else { $windowsBuild }

            # check if key meets the version criteria
            $isWinverSupported = $windowsBuild -ge $minVersion -and $windowsBuild -le $maxVersion

            # check if registry key is associated with option
            $isKeyAssociated = $key["apply_if"].Contains($optionName)

            $keyName = $key["key_name"]

            if ($isWinverSupported -and $isKeyAssociated) {
                Write-Host "$($path)`n    $(if ($keyName -eq "@") { "Default" } else { $keyName } ) $($key["type"]) $($key["value"])`n"
            }
        }
    }
}

function Get-Key-String($keyData) {
    # default key does not have extra quotes
    $keyName = $keyData["key_name"]

    if ($keyName -eq "@") {
        $line = "@"
    } else {
        $line = "`"$($keyName)`""
    }

    switch ($keyData["type"]) {
        "REG_DWORD" {
            $hexValue = "{0:X8}" -f $keyData["value"]
            $line += "=dword:$($hexValue)"
        }
        "REG_SZ" {
            $line += "=`"$($keyData["value"])`""
        }
        "REG_DELETE" {
            $line += "=-"
        }
        default {
            Write-Host "error: unrecognized type $($keyData["type"]) for key $($keyName)"
            return $null
        }
    }

    return $line
}

function ConvertTo-TitleCase($string) {
    # define small words that should remain lowercase
    $smallWords = @("a", "an", "and", "as", "at", "but", "by", "for", "if", "in", "nor", "of", "on", "or", "so", "the", "to", "up", "yet")

    # split the input string into an array of words
    $words = $string -split '\s+'

    # initialize an empty array to store capitalized words
    $capitalizedWords = @()

    # loop through each word and capitalize appropriately
    for ($i = 0; $i -lt $words.Length; $i++) {
        if ($i -eq 0 -or $i -eq ($words.Length - 1) -or $smallWords -notcontains $words[$i]) {
            # capitalize the first letter of the word
            $capitalizedWords += $words[$i].Substring(0, 1).ToUpper() + $words[$i].Substring(1).ToLower()
        } else {
            # keep the word as lowercase
            $capitalizedWords += $words[$i].ToLower()
        }
    }

    $capitalizedString = $capitalizedWords -join " "

    return $capitalizedString
}

function Get-WinVer($windowsBuild) {
    $version = ""

    switch ($windowsBuild) {
        { $_ -ge 22000 } { $version = "Windows 11"; break }
        { $_ -ge 10240 } { $version = "Windows 10"; break }
        { $_ -ge 9600 } { $version = "Windows 8.1"; break }
        { $_ -ge 9200 } { $version = "Windows 8"; break }
        { $_ -ge 7600 } { $version = "Windows 7"; break }
        default {
            Write-Host "error: unrecognized windows build $($windowsBuild)"
        }
    }

    return $version
}

function main() {
    Set-Location $PSScriptRoot

    if (-not (Test-Path "registry-options.json")) {
        Write-Host "error: registry-options.json not found"
        return 1
    }

    $config = Get-Content -Path "registry-options.json" -Raw | ConvertFrom-Json

    if ($build_docs) {
        # an ordered hashmap must be used to preserve the order of config options
        $options = New-Object System.Collections.Specialized.OrderedDictionary

        $config = Get-Content -Path "registry-options.json" -Raw | ConvertFrom-Json

        # get all option names in the sorted hashmap
        foreach ($option in $config.options.PSObject.Properties.Name) {
            $options.Add($option, (New-Object System.Collections.Specialized.OrderedDictionary))
        }

        # populate the hashmap with all the option paths and keys
        foreach ($path in $entries.Keys) {
            foreach ($key in $entries[$path]) {
                foreach ($applyIfOption in $key["apply_if"]) {
                    # initialize path if it doesn't
                    if (-not ($options[$applyIfOption].Contains($path))) {
                        $options[$applyIfOption].Add($path, (New-Object System.Collections.ArrayList))
                    }

                    $options[$applyIfOption][$path].Add($key)
                }
            }
        }

        $hasError = $false
        $mdfile = "..\docs\registry-opts.md"

        Set-Content -Path $mdfile -Value "# Registry Options`n"

        foreach ($option in $options.Keys) {
            # create option name subheading
            $optionSubheading = ConvertTo-TitleCase -string $option
            Add-Content -Path $mdfile -Value "## $($optionSubheading)`n"

            # start code block
            Add-Content -Path $mdfile -Value "``````"

            # used to keep track of last path
            $keyCount = 0

            foreach ($path in $options[$option].Keys) {
                # write path
                Add-Content -Path $mdfile -Value "[$($path)]"

                foreach ($key in $options[$option][$path]) {
                    $keyString = Get-Key-String -keyData $key

                    if ($null -eq $keyString) {
                        $hasError = $true
                    }

                    $hasMinVer = $key.Contains("min_version")
                    $hasMaxVer = $key.Contains("max_version")

                    if ($hasMinVer -and $hasMaxVer) {
                        $minVer = $key["min_version"]
                        $maxVer = $key["max_version"]
                        $minWinVer = Get-WinVer -windowsBuild $minVer
                        $maxWinVer = Get-WinVer -windowsBuild $maxVer

                        $keyString += "; $($minWinVer) $($minVer)"

                        if ($minVer -eq $maxVer) {
                            $keyString += " only"
                        } elseif ($minWinVer -eq $maxWinVer) {
                            $keyString += " - $($maxVer)"
                        } else {
                            $keyString += " - $($maxWinVer) $($maxVer)"
                        }
                    } elseif ($hasMinVer -and -not $hasMaxVer) {
                        $keyString += " ; $(Get-WinVer -windowsBuild $key["min_version"]) $($key["min_version"]) and later"
                    } elseif (-not $hasMinVer -and $hasMaxVer) {
                        $keyString += " ; $(Get-WinVer -windowsBuild $key["max_version"]) $($key["max_version"]) and earlier"
                    }

                    Add-Content -Path $mdfile -Value $keyString
                }

                $keyCount++
                $isLastPath = $keyCount -eq $options[$option].Keys.Count

                if (-not $isLastPath) {
                    # add new line if not last path
                    Add-Content -Path $mdfile -Value ""
                }

            }

            # end code block
            Add-Content -Path $mdfile -Value "```````n"
        }

        if ($hasError) {
            return 1
        }

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

    if (-not (Test-Path "MinSudo.exe")) {
        Write-Host "error: MinSudo.exe not found in current directory"
        return 1
    }

    # contains keys to apply after all version filtering and config validation
    $filteredEntries = @{}

    # track seen options to find unrecognized options in registry-options.json
    $seenOptions = New-Object System.Collections.Generic.HashSet[string]
    $undefinedOptions = New-Object System.Collections.Generic.HashSet[string]

    Write-Host "info: parsing config"

    foreach ($path in $entries.Keys) {
        foreach ($key in $entries[$path]) {
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
                    $filteredEntries.Add($path, (New-Object System.Collections.ArrayList))
                }

                $filteredEntries[$path].Add($key)
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

        foreach ($key in $filteredEntries[$path]) {
            $keyString = Get-Key-String -keyData $key

            if ($null -eq $keyString) {
                $hasError = $true
            }

            Add-Content -Path $registryFile -Value $keyString
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
