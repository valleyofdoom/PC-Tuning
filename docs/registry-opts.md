# Registry Options

## Disable Windows Update

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings]
"ExcludeWUDriversInQualityUpdate"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update]
"AUOptions"=dword:00000001 ; Windows 8.1 9600 and earlier
"SetupWizardLaunchTime"=- ; Windows 8.1 9600 and earlier
"AcceleratedInstallRequired"=- ; Windows 8.1 9600 and earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching]
"SearchOrderConfig"=dword:00000000
"DontSearchWindowsUpdate"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata]
"PreventDeviceMetadataFromNetwork"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]
"WUServer"=" "
"WUStatusServer"=" "
"UpdateServiceUrlAlternate"=" "
"DisableWindowsUpdateAccess"=dword:00000001
"DisableOSUpgrade"=dword:00000001 ; Windows 8 9200 and later
"SetDisableUXWUAccess"=dword:00000001 ; Windows 10 10240 and later
"ExcludeWUDriversInQualityUpdate"=dword:00000001 ; Windows 10 10240 and later
"DoNotConnectToWindowsUpdateInternetLocations"=dword:00000001 ; Windows 8.1 9600 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoUpdate"=dword:00000001
"UseWUServer"=dword:00000001
```

## Disable Automatic Windows Updates

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoUpdate"=dword:00000001
```

## Disable Driver Installation Via Windows Update

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings]
"ExcludeWUDriversInQualityUpdate"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching]
"SearchOrderConfig"=dword:00000000
"DontSearchWindowsUpdate"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata]
"PreventDeviceMetadataFromNetwork"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]
"ExcludeWUDriversInQualityUpdate"=dword:00000001 ; Windows 10 10240 and later
```

## Disable Automatic Store App Updates

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]
"AutoDownload"=dword:00000002 ; Windows 8.1 9600 and later
```

## Disable Windows Defender

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet]
"SpyNetReporting"=dword:00000000 ; Windows 10 10240 and later
"SubmitSamplesConsent"=dword:00000000 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense]
"Start"=dword:00000004 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
"SmartScreenEnabled"="Off" ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]
"DisableScanOnRealtimeEnable"=dword:00000001
"DisableBehaviorMonitoring"=dword:00000001 ; Windows 8 9200 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc]
"Start"=dword:00000004 ; Windows 8 9200 and later

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost]
"EnableWebContentEvaluation"=dword:00000000 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MsSecCore]
"Start"=dword:00000004 ; Windows 11 22000 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
"SecurityHealth"=- ; Windows 10 10240 and later
"WindowsDefender"=- ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot]
"Start"=dword:00000004 ; Windows 8 9200 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv]
"Start"=dword:00000004 ; Windows 8 9200 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]
"Start"=dword:00000004 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity]
"Enabled"=dword:00000000 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection]
"DisableScanOnRealtimeEnable"=dword:00000001
"DisableOnAccessProtection"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy]
"VerifiedAndReputablePolicyState"=dword:00000000 ; Windows 11 22000 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableAntiSpyware"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WTDS\Components]
"ServiceEnabled"=dword:00000000 ; Windows 11 22000 and later

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled]
@=dword:00000000 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter]
"Start"=dword:00000004 ; Windows 8 9200 and later
```

## Disable Gamebarpresencewriter

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter]
"ActivationType"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Background Apps

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy]
"LetAppsRunInBackground"=dword:00000002 ; Windows 10 10240 and later
```

## Disable Transparency Effects

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize]
"EnableTransparency"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Notifications Network Usage

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]
"NoCloudApplicationNotification"=dword:00000001 ; Windows 8 9200 and later
```

## Disable Windows Marking File Attachments With Information About Their Zone of Origin

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments]
"SaveZoneInformation"=dword:00000001
```

## Disable Malicious Software Removal Tool Updates

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]
"DontOfferThroughWUAU"=dword:00000001
```

## Disable Sticky Keys

```
[HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys]
"Flags"="506"
```

## Disable Pointer Acceleration

```
[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseSpeed"="0"
"MouseThreshold1"="0"
"MouseThreshold2"="0"
```

## Disable Fast Startup

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]
"HiberbootEnabled"=dword:00000000
```

## Disable Customer Experience Improvement Program

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM]
"OptIn"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client]
"CEIP"=dword:00000002
```

## Disable Windows Error Reporting

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]
"DoReport"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent]
"DefaultConsent"=dword:00000001 ; Windows 8.1 9600 and earlier

[HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting]
"DontSendAdditionalData"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]
"Disabled"=dword:00000001
```

## Disable Clipboard History

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"AllowClipboardHistory"=dword:00000000 ; Windows 10 10240 and later
"AllowCrossDeviceClipboard"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Activity Feed

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"EnableActivityFeed"=dword:00000000 ; Windows 10 10240 and later
"PublishUserActivities"=dword:00000000 ; Windows 10 10240 and later
"UploadUserActivities"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Advertising Id

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo]
"DisabledByGroupPolicy"=dword:00000001 ; Windows 8.1 9600 and later
```

## Disable Autoplay

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000FF
"NoAutorun"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer]
"NoAutoplayfornonVolume"=dword:00000001
```

## Disable Cloud Content

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]
"DisableCloudOptimizedContent"=dword:00000001 ; Windows 10 18363 and later
"DisableConsumerAccountStateContent"=dword:00000001 ; Windows 10 18363 and later
"DisableSoftLanding"=dword:00000001 ; Windows 10 10240 and later
"DisableWindowsConsumerFeatures"=dword:00000001 ; Windows 10 10240 and later
```

## Disable Account-based Explorer Features

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer]
"DisableGraphRecentItems"=dword:00000001 ; Windows 11 22621 and later
```

## Disable Mdm Enrollment

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\MDM]
"DisableRegistration"=dword:00000001 ; Windows 10 10240 and later
```

## Disable Microsoft Store Push to Install Feature

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PushToInstall]
"DisablePushToInstall"=dword:00000001 ; Windows 10 10240 and later
```

## Mitigate Web-based Search Info

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]
"AllowCortana"=dword:00000000 ; Windows 10 10240 and later
"ConnectedSearchUseWeb"=dword:00000000 ; Windows 8.1 9600 and later
"ConnectedSearchPrivacy"=dword:00000003; Windows 8.1 9600 only
```

## Disable Sending Inking and Typing Data to Microsoft

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput]
"AllowLinguisticDataCollection"=dword:00000000 ; Windows 10 17134 and later
```

## Disable Automatic Maintenance

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]
"MaintenanceDisabled"=dword:00000001
```

## Disable Program Compatibility Assistant

```
[HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\AppCompat]
"DisablePCA"=dword:00000001
```

## Disable Remote Assistance

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance]
"fAllowToGetHelp"=dword:00000000
```

## Disable Sign-in and Lock Last Interactive User After a Restart

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"DisableAutomaticRestartSignOn"=dword:00000001 ; Windows 10 18362 and later
```

## Show File Extensions

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"HideFileExt"=dword:00000000
```

## Disable Widgets

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh]
"AllowNewsAndInterests"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Telemetry

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack]
"Start"=dword:00000004 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment]
"POWERSHELL_TELEMETRY_OPTOUT"="1"

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection]
"AllowTelemetry"=dword:00000000 ; Windows 10 10240 and later
"LimitDiagnosticLogCollection"=dword:00000001 ; Windows 10 18363 and later
"LimitDumpCollection"=dword:00000001 ; Windows 10 18363 and later
"LimitEnhancedDiagnosticDataWindowsAnalytics"=dword:00000000 ; Windows 10 16299 and later
"DoNotShowFeedbackNotifications"=dword:00000001 ; Windows 10 10240 and later
```

## Disable Retrieval of Online Tips and Help in the Immersive Control Panel

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"AllowOnlineTips"=dword:00000000 ; Windows 10 16299 and later
```

## Disable Typing Insights

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\input\Settings]
"InsightsEnabled"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Suggestions in the Search Box and in Search Home

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings]
"IsDynamicSearchBoxEnabled"=dword:00000000 ; Windows 11 22000 and later
```

## Disable Computer Is Out of Support Message

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\EOSNotify]
"DiscontinueEOS"=dword:00000001 ; Windows 8.1 9600 and earlier
```

## Disable Fault Tolerant Heap

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\FTH]
"Enabled"=dword:00000000
```

