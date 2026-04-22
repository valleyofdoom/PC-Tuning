param(
    [string]$get_option_keys,
    [int]$windows_build,
    [switch]$build_docs
)

$REGISTRY_OPTIONS_JSON = "registry-options.json"
$MDFILE = "..\docs\registry-opts.md"

$ENTRIES = [ordered]@{
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\EOSNotify"                                                                 = [ordered]@{
        "DiscontinueEOS" = @{
            "max_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable computer is out of support message")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"                                                                  = [ordered]@{
        "WUServer"                                     = @{
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        "WUStatusServer"                               = @{
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        "UpdateServiceUrlAlternate"                    = @{
            "value"    = " "
            "type"     = "REG_SZ"
            "apply_if" = @("disable windows update")
        }
        "DisableWindowsUpdateAccess"                   = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows update")
        }
        "DisableOSUpgrade"                             = @{
            "min_version" = 9200
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
        "SetDisableUXWUAccess"                         = @{
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
        "ExcludeWUDriversInQualityUpdate"              = @{
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
        "DoNotConnectToWindowsUpdateInternetLocations" = @{
            "min_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows update")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"                                                               = [ordered]@{
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
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update"                                                = [ordered]@{
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
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching"                                                          = [ordered]@{
        "SearchOrderConfig" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata"                                                          = [ordered]@{
        "PreventDeviceMetadataFromNetwork" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching"                                                                = [ordered]@{
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
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"                                                                       = [ordered]@{
        "ExcludeWUDriversInQualityUpdate" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @(
                "disable windows update"
                "disable driver installation via windows update"
            )
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"                                                          = [ordered]@{
        "DisableAutomaticRestartSignOn" = @{
            "min_version" = 18362
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable sign-in and lock last interactive user after a restart")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance"                                                  = [ordered]@{
        "MaintenanceDisabled" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable automatic maintenance")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments"                                                      = [ordered]@{
        "SaveZoneInformation" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows marking file attachments with information about their zone of origin")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient\Windows"                                                                               = [ordered]@{
        "CEIPEnable" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows"                                                                      = [ordered]@{
        "CEIPEnable" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM"                                                                   = [ordered]@{
        "OptIn" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client"                                                                       = [ordered]@{
        "CEIP" = @{
            "value"    = 2
            "type"     = "REG_DWORD"
            "apply_if" = @("disable customer experience improvement program")
        }
    }
    "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys"                                                                              = [ordered]@{
        "Flags" = @{
            "value"    = "506"
            "type"     = "REG_SZ"
            "apply_if" = @("disable sticky keys")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender"                                                                       = [ordered]@{
        "DisableAntiSpyware" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection"                                             = [ordered]@{
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
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"                                                  = [ordered]@{
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
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend"                                                                        = [ordered]@{
        "Start" = @{
            "value"    = 4
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MsSecCore"                                                                        = [ordered]@{
        "Start" = @{
            "min_version" = 22000
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc"                                                                           = [ordered]@{
        "Start" = @{
            "value"    = 4
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"                                                       = [ordered]@{
        "POWERSHELL_TELEMETRY_OPTOUT" = @{
            "value"    = "1"
            "type"     = "REG_SZ"
            "apply_if" = @("disable telemetry")
        }
    }
    "HKEY_CURRENT_USER\Control Panel\Mouse"                                                                                                 = [ordered]@{
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
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power"                                                             = [ordered]@{
        "HiberbootEnabled" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable fast startup")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting"                                                                = [ordered]@{
        "DoReport" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows error reporting")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent"                                                = [ordered]@{
        "DefaultConsent" = @{
            "max_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows error reporting")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting"                                                        = [ordered]@{
        "Disabled" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows error reporting")
        }
    }
    "HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting"                                                                  = [ordered]@{
        "DontSendAdditionalData" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable windows error reporting")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance"                                                                 = [ordered]@{
        "fAllowToGetHelp" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable remote assistance")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"                                                         = [ordered]@{
        "HideFileExt" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("show file extensions")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter"                                                                         = [ordered]@{
        "Start" = @{
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot"                                                                           = [ordered]@{
        "Start" = @{
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc"                                                                         = [ordered]@{
        "Start" = @{
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv"                                                                         = [ordered]@{
        "Start" = @{
            "min_version" = 9200
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"                                                                 = [ordered]@{
        "AllowCortana" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable suggestions and web results in the search box and in search home")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"                                               = [ordered]@{
        "NoCloudApplicationNotification" = @{
            "min_version" = 9200
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable notifications network usage")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService"                                                            = [ordered]@{
        "Start" = @{
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense"                                                                            = [ordered]@{
        "Start" = @{
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"                                                                      = [ordered]@{
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
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet"                                                                         = [ordered]@{
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
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"                                                                 = [ordered]@{
        "SmartScreenEnabled" = @{
            "min_version" = 10240
            "value"       = "Off"
            "type"        = "REG_SZ"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost"                                                                   = [ordered]@{
        "EnableWebContentEvaluation" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled"                                                                          = [ordered]@{
        "@" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" = [ordered]@{
        "ActivationType" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable gamebarpresencewriter")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack"                                                                        = [ordered]@{
        "Start" = @{
            "min_version" = 10240
            "value"       = 4
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection"                                                                 = [ordered]@{
        "AllowTelemetry"                              = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
        "LimitDiagnosticLogCollection"                = @{
            "min_version" = 18363
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
        "LimitDumpCollection"                         = @{
            "min_version" = 18363
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
        "LimitEnhancedDiagnosticDataWindowsAnalytics" = @{
            "min_version" = 16299
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
        "DoNotShowFeedbackNotifications"              = @{
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable telemetry")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"                                                        = [ordered]@{
        "AllowOnlineTips"    = @{
            "min_version" = 16299
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable retrieval of online tips and help in the immersive control panel")
        }
        "NoDriveTypeAutoRun" = @{
            "value"    = 255
            "type"     = "REG_DWORD"
            "apply_if" = @("disable autoplay")
        }
        "NoAutorun"          = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable autoplay")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\input\Settings"                                                                                   = [ordered]@{
        "InsightsEnabled" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable typing insights")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"                                                                     = [ordered]@{
        "LetAppsRunInBackground" = @{
            "min_version" = 10240
            "value"       = 2
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable background apps")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer"                                                                        = [ordered]@{
        "DisableSearchBoxSuggestions" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable suggestions and web results in the search box and in search home")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WTDS\Components"                                                          = [ordered]@{
        "ServiceEnabled" = @{
            "min_version" = 22000
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy"                                                                         = [ordered]@{
        "VerifiedAndReputablePolicyState" = @{
            "min_version" = 22000
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable windows defender")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT"                                                                                    = [ordered]@{
        "DontOfferThroughWUAU" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable malicious software removal tool updates")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh"                                                                                    = [ordered]@{
        "AllowNewsAndInterests" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable widgets")
        }
    }
    "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"                                                        = [ordered]@{
        "EnableTransparency" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable transparency effects")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore"                                                                           = [ordered]@{
        "AutoDownload" = @{
            "min_version" = 9600
            "value"       = 2
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable automatic store app updates")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System"                                                                         = [ordered]@{
        "AllowClipboardHistory"     = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable clipboard history")
        }
        "AllowCrossDeviceClipboard" = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable clipboard history")
        }
        "EnableActivityFeed"        = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable activity feed")
        }
        "PublishUserActivities"     = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable activity feed")
        }
        "UploadUserActivities"      = @{
            "min_version" = 10240
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable activity feed")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"                                                                = [ordered]@{
        "DisabledByGroupPolicy" = @{
            "min_version" = 9600
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable advertising id")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer"                                                                       = [ordered]@{
        "NoAutoplayfornonVolume" = @{
            "value"    = 1
            "type"     = "REG_DWORD"
            "apply_if" = @("disable autoplay")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"                                                                   = [ordered]@{
        "DisableCloudOptimizedContent"       = @{
            "min_version" = 18363
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable cloud content")
        }
        "DisableConsumerAccountStateContent" = @{
            "min_version" = 18363
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable cloud content")
        }
        "DisableSoftLanding"                 = @{
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable cloud content")
        }
        "DisableWindowsConsumerFeatures"     = @{
            "min_version" = 10240
            "value"       = 1
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable cloud content")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput"                                                       = [ordered]@{
        "AllowLinguisticDataCollection" = @{
            "min_version" = 17134
            "value"       = 0
            "type"        = "REG_DWORD"
            "apply_if"    = @("disable sending inking and typing data to microsoft")
        }
    }
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\FTH"                                                                                             = [ordered]@{
        "Enabled" = @{
            "value"    = 0
            "type"     = "REG_DWORD"
            "apply_if" = @("disable fault tolerant heap")
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

function Get-OptionKeys($optionName, $winVer) {
    foreach ($path in $ENTRIES.Keys) {
        foreach ($keyName in $ENTRIES[$path].Keys) {
            $keyData = $ENTRIES[$path][$keyName]

            # unspecified versions implies that they key should be applied to all versions
            $minVersion = if ($keyData.Contains("min_version")) { $keyData["min_version"] } else { $winVer }
            $maxVersion = if ($keyData.Contains("max_version")) { $keyData["max_version"] } else { $winVer }

            # check if key meets the version criteria
            $isWinverSupported = $winVer -ge $minVersion -and $winVer -le $maxVersion

            # check if registry key is associated with option
            $isKeyAssociated = $keyData["apply_if"].Contains($optionName)

            if ($isWinverSupported -and $isKeyAssociated) {
                Write-Host "$($path)`n    $(if ($keyName -eq "@") { "Default" } else { $keyName } ) $($keyData["type"]) $($keyData["value"])`n"
            }
        }
    }
}

function Get-KeyString($keyName, $keyData) {
    # default key does not have extra quotes
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

function Get-MajorBuild($winVer) {
    $majorBuild = $null

    switch ($winVer) {
        { $_ -ge 22000 } { $majorBuild = 11; break }
        { $_ -ge 10240 } { $majorBuild = 10; break }
        { $_ -ge 9600 } { $majorBuild = 8.1; break }
        { $_ -ge 9200 } { $majorBuild = 8; break }
        { $_ -ge 7600 } { $majorBuild = 7; break }
        default {
            Write-Host "error: unrecognized windows version $($winVer)"
        }
    }

    return $majorBuild
}

function main() {
    Set-Location $PSScriptRoot

    if (-not (Test-Path $REGISTRY_OPTIONS_JSON)) {
        Write-Host "error: $($REGISTRY_OPTIONS_JSON) not found"
        return 1
    }

    $config = Get-Content -Path $REGISTRY_OPTIONS_JSON -Raw | ConvertFrom-Json

    if ($build_docs) {
        # an ordered hashmap must be used to preserve the order of config options
        $options = New-Object System.Collections.Specialized.OrderedDictionary

        # get all option names in the sorted hashmap
        foreach ($option in $config.options.PSObject.Properties.Name) {
            $options.Add($option, (New-Object System.Collections.Specialized.OrderedDictionary))
        }

        # populate the hashmap with all the option paths and keys
        foreach ($path in $ENTRIES.Keys) {
            foreach ($keyName in $ENTRIES[$path].Keys) {
                $keyData = $ENTRIES[$path][$keyName]

                foreach ($applyIfOption in $keyData["apply_if"]) {
                    # initialize path if it doesn't exist
                    if (-not ($options[$applyIfOption].Contains($path))) {
                        $options[$applyIfOption].Add($path, (New-Object System.Collections.Specialized.OrderedDictionary))
                    }

                    $options[$applyIfOption][$path].Add($keyName, $keyData)
                }
            }
        }

        $hasError = $false

        Set-Content -Path $MDFILE -Value "# Registry Options`n"

        foreach ($option in $options.Keys) {
            # create option name subheading
            $optionSubheading = ConvertTo-TitleCase -string $option
            Add-Content -Path $MDFILE -Value "## $($optionSubheading)`n"

            Add-Content -Path $MDFILE -Value "config option: ````$($option)`````n"

            # start code block
            Add-Content -Path $MDFILE -Value "``````"

            # used to keep track of last path
            $keyCount = 0

            foreach ($path in $options[$option].Keys) {
                # write path
                Add-Content -Path $MDFILE -Value "[$($path)]"

                foreach ($keyName in $options[$option][$path].Keys) {
                    $keyData = $options[$option][$path][$keyName]

                    $keyString = Get-KeyString -keyName $keyName -keyData $keyData

                    if ($null -eq $keyString) {
                        $hasError = $true
                    }

                    $hasMinVer = $keyData.Contains("min_version")
                    $hasMaxVer = $keyData.Contains("max_version")

                    if ($hasMinVer -and $hasMaxVer) {
                        $minVer = $keyData["min_version"]
                        $maxVer = $keyData["max_version"]

                        if ($minVer -gt $maxVer) {
                            Write-Host "error: invalid min/max version range for $($keyName)"
                            $hasError = $true
                        }

                        $minMajorBuild = Get-MajorBuild -winVer $minVer
                        $maxMajorBuild = Get-MajorBuild -winVer $maxVer

                        if ($null -eq $minMajorBuild -or $null -eq $maxMajorBuild) {
                            return 1
                        }

                        $keyString += " ; Windows $($minMajorBuild) $($minVer)"

                        if ($minVer -eq $maxVer) {
                            $keyString += " only"
                        } elseif ($minMajorBuild -eq $maxMajorBuild) {
                            $keyString += " - $($maxVer)"
                        } else {
                            $keyString += " - Windows $($maxMajorBuild) $($maxVer)"
                        }
                    } elseif ($hasMinVer -and -not $hasMaxVer) {
                        $minMajorBuild = Get-MajorBuild -winVer $keyData["min_version"]

                        if ($null -eq $minMajorBuild) {
                            return 1
                        }

                        $keyString += " ; Windows $($minMajorBuild) $($keyData["min_version"]) and later"
                    } elseif (-not $hasMinVer -and $hasMaxVer) {
                        $maxMajorBuild = Get-MajorBuild -winVer $keyData["max_version"]

                        if ($null -eq $maxMajorBuild) {
                            return 1
                        }
                        $keyString += " ; Windows $($maxMajorBuild) $($keyData["max_version"]) and earlier"
                    }

                    Add-Content -Path $MDFILE -Value $keyString
                }

                $keyCount++
                $isLastPath = $keyCount -eq $options[$option].Keys.Count

                if (-not $isLastPath) {
                    # add new line if not last path
                    Add-Content -Path $MDFILE -Value ""
                }

            }

            # end code block
            Add-Content -Path $MDFILE -Value "```````n"
        }

        Write-Host "$(if ($hasError -ne 0) { "error: failed" } else { "info: succeeded" }) building docs"
        return $hasError
    }

    $winVer = if ($windows_build) { $windows_build } else { [System.Environment]::OSVersion.Version.Build }

    if ($get_option_keys) {
        # convert argument value to lower case as all option names are in lower case
        $get_option_keys = $get_option_keys.ToLower()

        $majorBuild = Get-MajorBuild -winVer $winVer

        if ($null -eq $majorBuild) {
            return 1
        }

        Write-Host "info: showing entries associated with option `"$($get_option_keys)`" on windows $($majorBuild) $($winVer)`n"

        Get-OptionKeys -optionName $get_option_keys -winVer $winVer
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

    # track seen options to find unrecognized options in $REGISTRY_OPTIONS_JSON
    $seenOptions = New-Object System.Collections.Generic.HashSet[string]
    $undefinedOptions = New-Object System.Collections.Generic.HashSet[string]

    Write-Host "info: parsing config"

    foreach ($path in $ENTRIES.Keys) {
        foreach ($keyName in $ENTRIES[$path].Keys) {
            $keyData = $ENTRIES[$path][$keyName]

            $isUserApplyKey = $false

            foreach ($applyIfOption in $keyData["apply_if"]) {
                # add option to set in order to keep track of what options have been seen so far
                $seenOptions.Add($applyIfOption)

                # check if option is in $REGISTRY_OPTIONS_JSON
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
            $minVersion = if ($keyData.Contains("min_version")) { $keyData["min_version"] } else { $winVer }
            $maxVersion = if ($keyData.Contains("max_version")) { $keyData["max_version"] } else { $winVer }

            # check if key meets the version criteria
            $isWinverSupported = $winVer -ge $minVersion -and $winVer -le $maxVersion

            # this is used later to determine whether the key should be applied or not
            $keyData["is_apply"] = $isUserApplyKey -and $isWinverSupported
        }
    }

    # validate the config
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
        Write-Host "error: resolve $($configErrors) errors in config before trying again"
        return 1
    }

    Write-Host "info: creating registry file"

    $hasError = $false
    $registryFile = "$($env:TEMP)\tmp.reg"

    # registry file header and clear previous contents
    Set-Content -Path $registryFile -Value "Windows Registry Editor Version 5.00`n"

    foreach ($path in $ENTRIES.Keys) {
        # check if any keys under a path that will get applied to avoid writing an empty path to the .reg file
        $pathIsUsed = $ENTRIES[$path].values | Where-Object { $_["is_apply"] } | Measure-Object | Select-Object -ExpandProperty Count

        if (-not $pathIsUsed) {
            continue
        }

        Add-Content -Path $registryFile -Value "[$($path)]"

        foreach ($keyName in $ENTRIES[$path].Keys) {
            $keyData = $ENTRIES[$path][$keyName]

            if (-not $keyData["is_apply"]) {
                continue
            }

            $keyString = Get-KeyString -keyName $keyName -keyData $keyData

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

    $currentMajorBuild = Get-MajorBuild -winVer $winVer

    if ($null -eq $currentMajorBuild) {
        return 1
    }

    Write-Host "$(if ($mergeResult -ne 0) { "error: failed" } else { "info: succeeded" }) merging registry settings for windows $($currentMajorBuild) $($winVer)"
    return $mergeResult
}

$_exitCode = main
Write-Host # new line
exit $_exitCode
