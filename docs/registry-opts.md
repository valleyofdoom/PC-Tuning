# Registry Options

## Disable Windows Update

config option: ``disable windows update``

```
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

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update]
"AUOptions"=dword:00000001 ; Windows 8.1 9600 and earlier
"SetupWizardLaunchTime"=- ; Windows 8.1 9600 and earlier
"AcceleratedInstallRequired"=- ; Windows 8.1 9600 and earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata]
"PreventDeviceMetadataFromNetwork"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching]
"SearchOrderConfig"=dword:00000000
"DontSearchWindowsUpdate"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings]
"ExcludeWUDriversInQualityUpdate"=dword:00000001
```

## Disable Automatic Windows Updates

config option: ``disable automatic windows updates``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoUpdate"=dword:00000001
```

## Disable Driver Installation Via Windows Update

config option: ``disable driver installation via windows update``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]
"ExcludeWUDriversInQualityUpdate"=dword:00000001 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata]
"PreventDeviceMetadataFromNetwork"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching]
"SearchOrderConfig"=dword:00000000
"DontSearchWindowsUpdate"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings]
"ExcludeWUDriversInQualityUpdate"=dword:00000001
```

## Disable Automatic Store App Updates

config option: ``disable automatic store app updates``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]
"AutoDownload"=dword:00000002 ; Windows 8.1 9600 and later
```

## Disable Windows Defender

config option: ``disable windows defender``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableAntiSpyware"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection]
"DisableScanOnRealtimeEnable"=dword:00000001
"DisableOnAccessProtection"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]
"DisableScanOnRealtimeEnable"=dword:00000001
"DisableBehaviorMonitoring"=dword:00000001 ; Windows 8 9200 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MsSecCore]
"Start"=dword:00000004 ; Windows 11 22000 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter]
"Start"=dword:00000004 ; Windows 8 9200 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot]
"Start"=dword:00000004 ; Windows 8 9200 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc]
"Start"=dword:00000004 ; Windows 8 9200 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv]
"Start"=dword:00000004 ; Windows 8 9200 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]
"Start"=dword:00000004 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense]
"Start"=dword:00000004 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
"SecurityHealth"=- ; Windows 10 10240 and later
"WindowsDefender"=- ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet]
"SpyNetReporting"=dword:00000000 ; Windows 10 10240 and later
"SubmitSamplesConsent"=dword:00000000 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
"SmartScreenEnabled"="Off" ; Windows 10 10240 and later

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost]
"EnableWebContentEvaluation"=dword:00000000 ; Windows 10 10240 and later

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled]
@=dword:00000000 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WTDS\Components]
"ServiceEnabled"=dword:00000000 ; Windows 11 22000 and later

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy]
"VerifiedAndReputablePolicyState"=dword:00000000 ; Windows 11 22000 and later
```

## Disable Gamebarpresencewriter

config option: ``disable gamebarpresencewriter``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter]
"ActivationType"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Background Apps

config option: ``disable background apps``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy]
"LetAppsRunInBackground"=dword:00000002 ; Windows 10 10240 and later
```

## Disable Transparency Effects

config option: ``disable transparency effects``

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize]
"EnableTransparency"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Notifications Network Usage

config option: ``disable notifications network usage``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]
"NoCloudApplicationNotification"=dword:00000001 ; Windows 8 9200 and later
```

## Disable Windows Marking File Attachments With Information About Their Zone of Origin

config option: ``disable windows marking file attachments with information about their zone of origin``

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments]
"SaveZoneInformation"=dword:00000001
```

## Disable Malicious Software Removal Tool Updates

config option: ``disable malicious software removal tool updates``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]
"DontOfferThroughWUAU"=dword:00000001
```

## Disable Sticky Keys

config option: ``disable sticky keys``

```
[HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys]
"Flags"="506"
```

## Disable Pointer Acceleration

config option: ``disable pointer acceleration``

```
[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseSpeed"="0"
"MouseThreshold1"="0"
"MouseThreshold2"="0"
```

## Disable Fast Startup

config option: ``disable fast startup``

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]
"HiberbootEnabled"=dword:00000000
```

## Disable Customer Experience Improvement Program

config option: ``disable customer experience improvement program``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM]
"OptIn"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client]
"CEIP"=dword:00000002
```

## Disable Windows Error Reporting

config option: ``disable windows error reporting``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]
"DoReport"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent]
"DefaultConsent"=dword:00000001 ; Windows 8.1 9600 and earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]
"Disabled"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting]
"DontSendAdditionalData"=dword:00000001
```

## Disable Clipboard History

config option: ``disable clipboard history``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"AllowClipboardHistory"=dword:00000000 ; Windows 10 10240 and later
"AllowCrossDeviceClipboard"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Activity Feed

config option: ``disable activity feed``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"EnableActivityFeed"=dword:00000000 ; Windows 10 10240 and later
"PublishUserActivities"=dword:00000000 ; Windows 10 10240 and later
"UploadUserActivities"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Advertising Id

config option: ``disable advertising id``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo]
"DisabledByGroupPolicy"=dword:00000001 ; Windows 8.1 9600 and later
```

## Disable Autoplay

config option: ``disable autoplay``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000FF
"NoAutorun"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer]
"NoAutoplayfornonVolume"=dword:00000001
```

## Disable Cloud Content

config option: ``disable cloud content``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]
"DisableCloudOptimizedContent"=dword:00000001 ; Windows 10 18363 and later
"DisableConsumerAccountStateContent"=dword:00000001 ; Windows 10 18363 and later
"DisableSoftLanding"=dword:00000001 ; Windows 10 10240 and later
"DisableWindowsConsumerFeatures"=dword:00000001 ; Windows 10 10240 and later
```

## Disable Suggestions and Web Results in the Search Box and in Search Home

config option: ``disable suggestions and web results in the search box and in search home``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]
"AllowCortana"=dword:00000000 ; Windows 10 10240 and later

[HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer]
"DisableSearchBoxSuggestions"=dword:00000001
```

## Disable Sending Inking and Typing Data to Microsoft

config option: ``disable sending inking and typing data to microsoft``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput]
"AllowLinguisticDataCollection"=dword:00000000 ; Windows 10 17134 and later
```

## Disable Automatic Maintenance

config option: ``disable automatic maintenance``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]
"MaintenanceDisabled"=dword:00000001
```

## Disable Computer Is Out of Support Message

config option: ``disable computer is out of support message``

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\EOSNotify]
"DiscontinueEOS"=dword:00000001 ; Windows 8.1 9600 and earlier
```

## Disable Fault Tolerant Heap

config option: ``disable fault tolerant heap``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\FTH]
"Enabled"=dword:00000000
```

## Disable Sign-in and Lock Last Interactive User After a Restart

config option: ``disable sign-in and lock last interactive user after a restart``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"DisableAutomaticRestartSignOn"=dword:00000001 ; Windows 10 18362 and later
```

## Show File Extensions

config option: ``show file extensions``

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"HideFileExt"=dword:00000000
```

## Disable Widgets

config option: ``disable widgets``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh]
"AllowNewsAndInterests"=dword:00000000 ; Windows 10 10240 and later
```

## Disable Remote Assistance

config option: ``disable remote assistance``

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance]
"fAllowToGetHelp"=dword:00000000
```

## Disable Telemetry

config option: ``disable telemetry``

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment]
"POWERSHELL_TELEMETRY_OPTOUT"="1"

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack]
"Start"=dword:00000004 ; Windows 10 10240 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection]
"AllowTelemetry"=dword:00000000 ; Windows 10 10240 and later
"LimitDiagnosticLogCollection"=dword:00000001 ; Windows 10 18363 and later
"LimitDumpCollection"=dword:00000001 ; Windows 10 18363 and later
"LimitEnhancedDiagnosticDataWindowsAnalytics"=dword:00000000 ; Windows 10 16299 and later
"DoNotShowFeedbackNotifications"=dword:00000001 ; Windows 10 10240 and later
```

## Disable Retrieval of Online Tips and Help in the Immersive Control Panel

config option: ``disable retrieval of online tips and help in the immersive control panel``

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"AllowOnlineTips"=dword:00000000 ; Windows 10 16299 and later
```

## Disable Typing Insights

config option: ``disable typing insights``

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\input\Settings]
"InsightsEnabled"=dword:00000000 ; Windows 10 10240 and later
```

