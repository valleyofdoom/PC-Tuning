# Registry Options

## Disable Windows Update

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]
"WUServer"=" "
"ExcludeWUDriversInQualityUpdate"=dword:00000001 ; 10240 or earlier
"DisableOSUpgrade"=dword:00000001 ; 9200 or earlier
"WUStatusServer"=" "
"UpdateServiceUrlAlternate"=" "
"DisableWindowsUpdateAccess"=dword:00000001
"SetDisableUXWUAccess"=dword:00000001 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching]
"SearchOrderConfig"=dword:00000000
"DontSearchWindowsUpdate"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update]
"AcceleratedInstallRequired"=- ; 9600 and later
"SetupWizardLaunchTime"=- ; 9600 and later
"AUOptions"=dword:00000001 ; 9600 and later

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoUpdate"=dword:00000001
"UseWUServer"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata]
"PreventDeviceMetadataFromNetwork"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings]
"ExcludeWUDriversInQualityUpdate"=dword:00000001
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

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]
"ExcludeWUDriversInQualityUpdate"=dword:00000001 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata]
"PreventDeviceMetadataFromNetwork"=dword:00000001
```

## Disable Automatic Store App Updates

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]
"AutoDownload"=dword:00000004 ; 9600 or earlier
```

## Disable User Account Control

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"EnableLUA"=dword:00000000
```

## Disable Windows Marking File Attachments With Information About Their Zone of Origin

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments]
"SaveZoneInformation"=dword:00000001
```

## Disable Windows Defender

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet]
"SpyNetReporting"=dword:00000000 ; 10240 or earlier
"SubmitSamplesConsent"=dword:00000000 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot]
"Start"=dword:00000004 ; 9200 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]
"DisableScanOnRealtimeEnable"=dword:00000001
"DisableBehaviorMonitoring"=dword:00000001 ; 9200 or earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
"SmartScreenEnabled"="Off" ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv]
"Start"=dword:00000004 ; 9200 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc]
"Start"=dword:00000004 ; 9200 or earlier

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost]
"EnableWebContentEvaluation"=dword:00000000 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableAntiSpyware"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense]
"Start"=dword:00000004 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity]
"Enabled"=dword:00000000 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection]
"DisableScanOnRealtimeEnable"=dword:00000001
"DisableOnAccessProtection"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter]
"Start"=dword:00000004 ; 9200 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy]
"VerifiedAndReputablePolicyState"=dword:00000000 ; 22000 or earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
"SecurityHealth"=- ; 10240 or earlier
"WindowsDefender"=- ; 10240 or earlier

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled]
@=dword:00000000 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WTDS\Components]
"ServiceEnabled"=dword:00000000 ; 22000 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]
"Start"=dword:00000004 ; 10240 or earlier
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
"MouseThreshold2"="0"
"MouseThreshold1"="0"
```

## Disable Fast Startup

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]
"HiberbootEnabled"=dword:00000000
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

## Disable Fault Tolerant Heap

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\FTH]
"Enabled"=dword:00000000
```

## Disable Gamebarpresencewriter

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter]
"ActivationType"=dword:00000000 ; 10240 or earlier
```

## Disable Background Apps

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy]
"LetAppsRunInBackground"=dword:00000002 ; 10240 or earlier
```

## Disable Remote Assistance

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance]
"fAllowToGetHelp"=dword:00000000
```

## Disable Sign-in and Lock Last Interactive User After a Restart

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"DisableAutomaticRestartSignOn"=dword:00000001 ; 18362 or earlier
```

## Show File Extensions

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"HideFileExt"=dword:00000000
```

## Disable Widgets

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh]
"AllowNewsAndInterests"=dword:00000000 ; 10240 or earlier
```

## Disable Customer Experience Improvement Program

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM]
"OptIn"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000
```

## Disable Windows Error Reporting

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]
"DoReport"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]
"Disabled"=dword:00000001
```

## Disable Search the Web or Display Web Results in Search

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]
"ConnectedSearchUseWeb"=dword:00000000 ; 9600 or earlier
```

## Disable Notifications Network Usage

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]
"NoCloudApplicationNotification"=dword:00000001 ; 9200 or earlier
```

## Disable Telemetry

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection]
"AllowTelemetry"=dword:00000000 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack]
"Start"=dword:00000004 ; 10240 or earlier

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment]
"POWERSHELL_TELEMETRY_OPTOUT"="1"
```

## Disable Retrieval of Online Tips and Help in the Immersive Control Panel

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"AllowOnlineTips"=dword:00000000 ; 16299 or earlier
```

## Disable Typing Insights

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\input\Settings]
"InsightsEnabled"=dword:00000000 ; 10240 or earlier
```

## Disable Suggestions in the Search Box and in Search Home

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings]
"IsDynamicSearchBoxEnabled"=dword:00000000 ; 22000 or earlier
```

## Disable Computer Is Out of Support Message

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\EOSNotify]
"DiscontinueEOS"=dword:00000001 ; 9600 and later
```

## Disable Transparency Effects

```
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize]
"EnableTransparency"=dword:00000000 ; 10240 or earlier
```

