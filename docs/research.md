<h1 id="research">Research <a href="#research">(permalink)</a></h1>

<h2 id="table-of-contents">1. Table of Contents <a href="#table-of-contents">(permalink)</a></h2>

- [1. Table of Contents](#table-of-contents)
- [2. How Can You Verify Whether a DSCP QoS Policy Is Working?](#how-can-you-verify-whether-a-dscp-qos-policy-is-working)
- [3. What TscSyncPolicy Does Windows Use by Default?](#what-tscsyncpolicy-does-windows-use-by-default)
- [4. How many RSS Queues do you need?](#how-many-rss-queues-do-you-need)
- [5. Ambiguous Win32PrioritySeparation Values Explained](#ambiguous-win32priorityseparation-values-explained)
- [6. Fixing Timing Precision in Windows After “The Great Rule Change”](#fixing-timing-precision-in-windows-after-the-great-rule-change)
- [7. Micro-Adjusting Timer Resolution for Higher Precision](#micro-adjusting-timer-resolution-for-higher-precision)
- [8. What Is Identity Scaling and How Can You Use It?](#what-is-identity-scaling-and-how-can-you-use-it)

<h2 id="how-can-you-verify-whether-a-dscp-qos-policy-is-working">2. How Can You Verify Whether a DSCP QoS Policy Is Working? <a href="#how-can-you-verify-whether-a-dscp-qos-policy-is-working">(permalink)</a></h2>

- Download and install [Microsoft Network Monitor 3.4](https://www.microsoft.com/en-us/download/details.aspx?id=4865)

- Create a new capture

- Open the application that you have applied a DSCP value for and reproduce a scenario where packets will be sent and received such as an online game mode

- Press F5 to start logging. After 30 seconds or so press F7 to end logging

- In the left-hand pane, click on the process name and click on a packet header. Expand the packet info under the frame details and finally expand the Ipv4 subcategory. This will reveal the current DSCP value of each frame as shown below

    ```
    DifferentiatedServices Field: DSCP: 46, ECN: 0
    ```

<h2 id="what-tscsyncpolicy-does-windows-use-by-default">3. What TscSyncPolicy Does Windows Use by Default? <a href="#what-tscsyncpolicy-does-windows-use-by-default">(permalink)</a></h2>

After searching through the decompiled ``ntoskrnl.exe`` pseudocode in [Hex-Rays IDA](https://hex-rays.com/products/idahome), I noticed that HalpTscSyncPolicy is changed when TscSyncPolicy is configured by modifying the BCD store. Despite many claims of enhanced being the default value, there has not been evidence, so I decided to find out myself.

We can read HalpTscSyncPolicy in a local kernel debugger such as [WinDbg](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools) in real-time to find out the different values it returns with different bcd store configurations.

``bcdedit.exe /deletevalue tscsyncpolicy`` (Windows default)

```
lkd> dd HalpTscSyncPolicy l1
fffff801`2de4a3ac  00000000
```

``bcdedit.exe /set tscsyncpolicy default``

```
lkd> dd HalpTscSyncPolicy l1
fffff803`1dc4a3ac  00000000
```

``bcdedit.exe /set tscsyncpolicy legacy``

```
lkd> dd HalpTscSyncPolicy l1
fffff805`1dc4a3ac  00000001
```

``bcdedit.exe /set tscsyncpolicy enhanced``

```
lkd> dd HalpTscSyncPolicy l1
fffff802`2864a3ac  00000002
```

In conclusion, Windows uses the default value, not enhanced or legacy. Although, the default value may correspond to another value which isn't exposed by reading the output of HalpTscSyncPolicy hence, further research is required.

<h2 id="how-many-rss-queues-do-you-need">4. How many RSS Queues do you need? <a href="#how-many-rss-queues-do-you-need">(permalink)</a></h2>

Receive side scaling (RSS) is a network driver technology that enables the efficient distribution of network receive processing across multiple CPUs in multiprocessor systems ([1](https://docs.microsoft.com/en-us/windows-hardware/drivers/network/introduction-to-receive-side-scaling)). The amount you should use or need depends on your typical network load. In server environments, a large amount of RSS queues is desirable as receive processing delays will be reduced and ensures that no CPU is heavily loaded. The same concept can be applied to a gaming machine however, the network load differs significantly making it an invalid comparison, so I decided to carry out some experiments to draw a reasonable conclusion.

I simulated Valorant's network traffic in iperf using two machines (~300kb/s receive in deathmatch) and monitored the network driver's activity in xperf. Note that RssBaseProcessor is set to 0, so theoretically, CPU 0 and CPU 1 should be handling DPCs/ISRs for the network driver as 2 RSS queues are configured.

<img src="/assets/images/300kbps-ndis-xperf-report.png" width="500">

I noticed that despite having RSS queues set to 2, only CPU 1 was primarily handling interrupts for the driver which I assume was due to such little traffic. So I decided to re-test with the same configuration. However, this time I simulated 1Gbps network traffic to verify this.

<img src="/assets/images/1gbps-ndis-xperf-report.png" width="500">

As expected, this scenario demonstrates that both CPU 0 and CPU 1 are handling DPCs/ISRs for the network driver with heavier traffic.

Conclusion: During online matches, at most two RSS queues/CPUs are being utilized. However, there is no harm in using more than two, but it is important to be aware of the information above as people reserve consecutive CPUs specifically for the network driver when those CPUs could better be used for another driver or a real-time application. The amount of RSS queues a network adapter has may also determine the quality of the hardware, but this is yet to be explored but something to keep in mind.

<h2 id="ambiguous-win32priorityseparation-values-explained">5. Ambiguous Win32PrioritySeparation Values Explained <a href="#ambiguous-win32priorityseparation-values-explained">(permalink)</a></h2>

According to the documentation Windows allows up to 0x3F (63 decimal) because the bitmask is made up of 6-bits, so why do values above this exist? What happens if we enter a value greater than the (theoretically) maximum allowed?

We can read PsPrioritySeparation and PspForegroundQuantum in a local kernel debugger such as WinDbg in real-time and use the quantum index provided in the Windows internals book to find out the different values it returns with different Win32PrioritySeparation entries.

<img src="/assets/images/w32ps-quantum-index.png" width="600">

Note: This table has changed in later versions of Windows 11 (24H2).

Demonstration with the Windows default, 0x2 (2 decimal)

```
lkd> dd PsPrioritySeparation L1
fffff802`3a6fc5c4  00000002

lkd> db PspForegroundQuantum L3
fffff802`3a72e874  06 0c 12
```

PspForegroundQuantum returns the values in hexadecimal, so we need to convert it to decimal in order to use the tables correctly. ``06 0c 12`` is equivalent to ``6 12 18`` and PsPrioritySeparation returns ``2``. In the tables, this corresponds to short, variable, 3:1 (``18 / 6 = 3``). But we already knew this as it is documented by Microsoft, so now lets try an ambiguous value.

``0xffff3f91 (4294918033 decimal)``

```
lkd> dd PsPrioritySeparation L1
fffff802`3a6fc5c4  00000001

lkd> db PspForegroundQuantum L3
fffff802`3a72e874  0c 18 24
```

``0c 18 24`` is equivalent to ``12 24 36`` and PsPrioritySeparation returns ``1`` which corresponds to long, variable, 2:1 (``24 / 12 = 2``). Nothing special as it seems, this is equivalent to values less than the maximum documented value as shown in [this csv](https://raw.githubusercontent.com/djdallmann/GamingPCSetup/master/CONTENT/RESEARCH/FINDINGS/win32prisep0to271.csv). I had the same results while testing various other values.

Conclusion: Why does Windows allow us to enter values greater than 0x3F (63 decimal) if any value greater than this is equivalent to values less than the maximum documented value? The reason behind this is that the maximum value for a REG_DWORD is 0xFFFFFFFF (4294967295 decimal) and there are no restrictions in place to prevent users to entering an illogical value, so when the kernel reads the Win32PrioritySeparation registry key, it must account for invalid values, so it only reads a portion of the entered value. The portion it chooses to read is the first 6-bits of the bitmask which means values greater than 63 are recurring values. The table below consists of all possible values (consistent between client and server editions of Windows as ``00`` or ``11`` were not used in ``XXYY`` of ``XXYYZZ`` in the bitmask which have different meanings on client/server).

Although a foreground boost can not be used when using a fixed length interval in terms of the quantum, PsPrioritySeparation still changes, and another thread priority boosting mechanism just happens to use the value of it so in reality, a fixed 3:1 quantum should have a perceivable difference compared to a fixed 1:1 quantum. See the paragraph below from Windows Internals.

> As will be described shortly, whenever a thread in the foreground process completes a wait operation on
a kernel object, the kernel boosts its current (not base) priority by the current value of
PsPrioritySeparation. (The windowing system is responsible for determining which process is
considered to be in the foreground.) As described earlier in this chapter in the section “Controlling the
quantum,” PsPrioritySeparation reflects the quantum-table index used to select quantums for the
threads of foreground applications. However, in this case, it is being used as a priority boost value.

|**Hexadecimal**|**Decimal**|**Binary**|**Interval**|**Length**|**PsPrioSep**|
|---|---|---|---|---|---|
|0x14|20|0b010100|Long|Variable|0|
|0x15|21|0b010101|Long|Variable|1|
|0x16|22|0b010110|Long|Variable|2|
|0x18|24|0b011000|Long|Fixed|0|
|0x19|25|0b011001|Long|Fixed|1|
|0x1A|26|0b011010|Long|Fixed|2|
|0x24|36|0b100100|Short|Variable|0|
|0x25|37|0b100101|Short|Variable|1|
|0x26|38|0b100110|Short|Variable|2|
|0x28|40|0b101000|Short|Fixed|0|
|0x29|41|0b101001|Short|Fixed|1|
|0x2A|42|0b101010|Short|Fixed|2|

<h2 id="fixing-timing-precision-in-windows-after-the-great-rule-change">6. Fixing Timing Precision in Windows After “The Great Rule Change” <a href="#fixing-timing-precision-in-windows-after-the-great-rule-change">(permalink)</a></h2>

Starting with 2004, the calling process attempting to raise the timer resolution no longer functions on a global level and is independent of other processes running on the system. A recent comment on the [Great Rule Change](https://randomascii.wordpress.com/2020/10/04/windows-timer-resolution-the-great-rule-change) article suggested a registry key which supposedly restores the old implementation, so I decided to investigate.

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"GlobalTimerResolutionRequests"=dword:00000001
```

I wrote two programs similar to Bruce Dawson's [measure_interval.cpp](https://github.com/randomascii/blogstuff/blob/main/timer_interval/measure_interval.cpp) and [change_interval.cpp](https://github.com/randomascii/blogstuff/blob/main/timer_interval/change_interval.cpp) program to benchmark how long the system sleeps for in reality when trying to sleep for 1ms by calling Sleep(1) and to raise the timer resolution. Compiled binaries and the source code can be found in the [TimerResolution](https://github.com/valleyofdoom/TimerResolution) repository. As the minimum resolution is 15.625ms, Sleep(1) has the potential to sleep up to ~16ms depending on the current resolution. We can determine whether another process calling for a higher resolution increases the sleep precision of our measure program.

**MeasureSleep.cpp**:

```cpp
ULONG MinimumResolution, MaximumResolution, CurrentResolution;
LARGE_INTEGER start, end, freq;

QueryPerformanceFrequency(&freq);

for (;;) {
    // get current resolution
    NtQueryTimerResolution(&MinimumResolution, &MaximumResolution, &CurrentResolution)

    // benchmark Sleep(1)
    QueryPerformanceCounter(&start);
    Sleep(1);
    QueryPerformanceCounter(&end);

    double delta_s = (double)(end.QuadPart - start.QuadPart) / freq.QuadPart;
    double delta_ms = delta_s * 1000;

    std::cout << "Resolution: " << (CurrentResolution / 10000.0) << "ms, Sleep(1) slept " << delta_ms << "ms (delta: " << delta_ms - 1 << ")\n";

    Sleep(1000); // pause for a second between iterations
}
```

**SetTimerResolution.cpp**:

```cpp
ULONG MinimumResolution, MaximumResolution, CurrentResolution;

NtQueryTimerResolution(&MinimumResolution, &MaximumResolution, &CurrentResolution)
NtSetTimerResolution(MaximumResolution, true, &CurrentResolution)

std::cout << "Resolution set to: " << (CurrentResolution / 10000.0) << "ms\n";
Sleep(INFINITE);
```

**Results (Windows 10 21H2 Client)**:

```
Resolution: 0.499200ms, Sleep(1) slept 15.510000ms (delta: 14.510000)
Resolution: 0.499200ms, Sleep(1) slept 15.540000ms (delta: 14.540000)
Resolution: 0.499200ms, Sleep(1) slept 15.480000ms (delta: 14.480000)
Resolution: 0.499200ms, Sleep(1) slept 15.581000ms (delta: 14.581000)
Resolution: 0.499200ms, Sleep(1) slept 15.547400ms (delta: 14.547400)
Resolution: 0.499200ms, Sleep(1) slept 15.474400ms (delta: 14.474400)
Resolution: 0.499200ms, Sleep(1) slept 15.475700ms (delta: 14.475700)
Resolution: 0.499200ms, Sleep(1) slept 15.546600ms (delta: 14.546600)
Resolution: 0.499200ms, Sleep(1) slept 15.480700ms (delta: 14.480700)
Resolution: 0.499200ms, Sleep(1) slept 15.504500ms (delta: 14.504500)
```

0.5ms resolution is requested, but it seems that it did not increase the precision of Sleep(1) which meant the registry key was not working, so I decided to dig further. Upon searching for the entry in ``ntoskrnl.exe`` with [Hex-Rays IDA](https://hex-rays.com/products/idahome), it seems that the string ``GlobalTimerResolutionRequests`` was nowhere to be found. Subsequently, I grabbed the kernel from Windows 11 22H2 and the string along with the entry seemed to exist in there. For reference, it is ``KiGlobalTimerResolutionRequests`` which can be read in a local kernel debugger such as WinDbg.

After collecting all the kernels from Windows 10 2004 - 22H2 client, LTSC and server editions, I can conclude that the entry only exists in Windows Server 2022+ and Windows 11+ which can be tested by checking whether the entry can be successfully read. Another observation is that the registry key is present and set to 1 by default on Windows Server 2022.

**Windows Server 2022+ and Windows 11+**:

```
lkd> dd KiGlobalTimerResolutionRequests L1
fffff803`444fb5c6  00000000
```

**Any other build**:

```
lkd> dd KiGlobalTimerResolutionRequests L1
Couldn't resolve error at 'KiGlobalTimerResolutionRequests '
```

Now that we have established what the supported Windows versions are, let's re-test the registry key. I'll be using Windows 11 rather than Windows Server for a particular reason which is explained later.

**Results (Windows 11 22H2)**:

```
Resolution: 0.500000ms, Sleep(1) slept 1.496800ms (delta: 0.496800)
Resolution: 0.500000ms, Sleep(1) slept 1.495600ms (delta: 0.495600)
Resolution: 0.500000ms, Sleep(1) slept 1.495300ms (delta: 0.495300)
Resolution: 0.500000ms, Sleep(1) slept 1.495600ms (delta: 0.495600)
Resolution: 0.500000ms, Sleep(1) slept 1.496400ms (delta: 0.496400)
Resolution: 0.500000ms, Sleep(1) slept 1.495300ms (delta: 0.495300)
Resolution: 15.625000ms, Sleep(1) slept 15.623500ms (delta: 14.623500)
Resolution: 15.625000ms, Sleep(1) slept 15.624500ms (delta: 14.624500)
Resolution: 15.625000ms, Sleep(1) slept 15.616100ms (delta: 14.616100)
Resolution: 15.625000ms, Sleep(1) slept 15.624200ms (delta: 14.624200)
```

As shown above, the registry key is working and Sleep(1) is sleeping around ~1.5ms which is what we want (the closer to 1ms the better). However, you can see that it was sleeping for ~16 ms towards the end. This is because I deliberately minimized the calling process to check whether GlobalTimerResolutionRequests circumvents this change as previously demonstrated:

> Starting with Windows 11, if a window-owning process becomes fully occluded, minimized, or otherwise invisible or inaudible to the end user, Windows does not guarantee a higher resolution than the default system resolution. See SetProcessInformation for more information on this behavior.

Luckily, [SetProcessInformation](https://learn.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessinformation) can be used so that the calling process's resolution request is respected regardless of it's state. This is done by adding the following lines:

```cpp
PROCESS_POWER_THROTTLING_STATE PowerThrottling;
RtlZeroMemory(&PowerThrottling, sizeof(PowerThrottling));

PowerThrottling.Version = PROCESS_POWER_THROTTLING_CURRENT_VERSION;
PowerThrottling.ControlMask = PROCESS_POWER_THROTTLING_IGNORE_TIMER_RESOLUTION;
PowerThrottling.StateMask = 0;

SetProcessInformation(GetCurrentProcess(), ProcessPowerThrottling, &PowerThrottling, sizeof(PowerThrottling));
```

Now we can confirm whether this works by minimizing the calling process as shown below to check if the resolution remains at ~0.5ms, and it indeed does.

```
Resolution: 0.500000ms, Sleep(1) slept 1.494400ms (delta: 0.494400)
Resolution: 0.500000ms, Sleep(1) slept 1.494700ms (delta: 0.494700)
Resolution: 0.500000ms, Sleep(1) slept 1.494900ms (delta: 0.494900)
Resolution: 0.500000ms, Sleep(1) slept 1.495200ms (delta: 0.495200)
Resolution: 0.500000ms, Sleep(1) slept 1.495800ms (delta: 0.495800) // minimized around here
Resolution: 0.500000ms, Sleep(1) slept 1.495900ms (delta: 0.495900)
Resolution: 0.500000ms, Sleep(1) slept 1.495900ms (delta: 0.495900)
Resolution: 0.500000ms, Sleep(1) slept 1.495800ms (delta: 0.495800)
Resolution: 0.500000ms, Sleep(1) slept 1.495500ms (delta: 0.495500)
Resolution: 0.500000ms, Sleep(1) slept 1.494400ms (delta: 0.494400)
```

<h2 id="micro-adjusting-timer-resolution-for-higher-precision">7. Micro-Adjusting Timer Resolution for Higher Precision <a href="#micro-adjusting-timer-resolution-for-higher-precision">(permalink)</a></h2>

Everyone is aware that raising the timer resolution/timer resolution results in higher precision. On most systems, 0.5ms is the maximum supported resolution, but what advantage does micro-adjusting the resolution bring to the table?

During a period of testing, I mistakenly set the timer resolution to arbitrary value instead of the maximum supported and noticed that the sleep delays being measured in the [MeasureSleep](https://github.com/valleyofdoom/TimerResolution) program were reproducibly lower compared to any resolution that was requested before. The results below consist of the sleep delays with different requested resolutions.

**1.000ms**:

```
Resolution: 0.999600ms, Sleep(1) slept 1.998081ms (delta: 0.998081)
Resolution: 0.999600ms, Sleep(1) slept 1.998593ms (delta: 0.998593)
Resolution: 0.999600ms, Sleep(1) slept 1.999105ms (delta: 0.999105)
Resolution: 0.999600ms, Sleep(1) slept 1.998849ms (delta: 0.998849)
Resolution: 0.999600ms, Sleep(1) slept 1.998849ms (delta: 0.998849)
Resolution: 0.999600ms, Sleep(1) slept 1.999105ms (delta: 0.999105)
Resolution: 0.999600ms, Sleep(1) slept 1.998849ms (delta: 0.998849)
Resolution: 0.999600ms, Sleep(1) slept 1.999105ms (delta: 0.999105)
Resolution: 0.999600ms, Sleep(1) slept 1.998849ms (delta: 0.998849)
Resolution: 0.999600ms, Sleep(1) slept 1.998593ms (delta: 0.998593)
```

**0.507ms**:

```
Resolution: 0.506800ms, Sleep(1) slept 1.012480ms (delta: 0.012480)
Resolution: 0.506800ms, Sleep(1) slept 1.011456ms (delta: 0.011456)
Resolution: 0.506800ms, Sleep(1) slept 1.012224ms (delta: 0.012224)
Resolution: 0.506800ms, Sleep(1) slept 1.012736ms (delta: 0.012736)
Resolution: 0.506800ms, Sleep(1) slept 1.012736ms (delta: 0.012736)
Resolution: 0.506800ms, Sleep(1) slept 1.012992ms (delta: 0.012992)
Resolution: 0.506800ms, Sleep(1) slept 1.012480ms (delta: 0.012480)
Resolution: 0.506800ms, Sleep(1) slept 1.012224ms (delta: 0.012224)
Resolution: 0.506800ms, Sleep(1) slept 1.012736ms (delta: 0.012736)
Resolution: 0.506800ms, Sleep(1) slept 1.012736ms (delta: 0.012736)
```

**0.500ms**:

```
Resolution: 0.499200ms, Sleep(1) slept 1.496064ms (delta: 0.496064)
Resolution: 0.499200ms, Sleep(1) slept 1.497856ms (delta: 0.497856)
Resolution: 0.499200ms, Sleep(1) slept 1.497344ms (delta: 0.497344)
Resolution: 0.499200ms, Sleep(1) slept 1.496832ms (delta: 0.496832)
Resolution: 0.499200ms, Sleep(1) slept 1.497088ms (delta: 0.497088)
Resolution: 0.499200ms, Sleep(1) slept 1.497344ms (delta: 0.497344)
Resolution: 0.499200ms, Sleep(1) slept 1.497088ms (delta: 0.497088)
Resolution: 0.499200ms, Sleep(1) slept 1.496832ms (delta: 0.496832)
Resolution: 0.499200ms, Sleep(1) slept 1.497088ms (delta: 0.497088)
Resolution: 0.499200ms, Sleep(1) slept 1.496832ms (delta: 0.496832)
```

Despite 0.500ms being a higher resolution than 0.507ms, it offers worse precision compared to a slightly lower resolution which is 0.507ms in this case. Note that this is also an arbitrary value, going higher than ~0.502ms is where Sleep(1) sleeps the same amount of time as if 0.500ms was requested on my system. It's a matter of finding a sweet spot with a low STDEV. The [micro-adjust-benchmark.ps1](https://github.com/valleyofdoom/TimerResolution) script can be used to automate the process.

30+ candidates were asked to compare 0.500ms against 0.507ms on their system under load. The observations are listed below.

- 0.500ms resolution for a marginal percentage of candidates was providing higher precision than 0.507ms. We were not able to come to a conclusion as to why after comparing BCD store configuration, hardware, timers, CPU/RAM frequency, Windows versions and more

- The remainder of candidates were able to reproduce my results of 0.507ms providing higher precision than 0.500ms

- One candidate that was using a laptop had to lower the resolution to 0.600ms to achieve low deltas

- 0.500ms resolution provided a high resolution for all candidates on Windows 7. There was not a case where 0.500ms resulted in ~0.49ms deltas as shown above

<h2 id="what-is-identity-scaling-and-how-can-you-use-it">8. What Is Identity Scaling and How Can You Use It? <a href="#what-is-identity-scaling-and-how-can-you-use-it">(permalink)</a></h2>

Identity scaling, sometimes referred to as *real no scaling*, is the operation which [SetDisplayConfig](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setdisplayconfig) uses when the desktop and monitor resolution are identical.

After monitoring registry activity while changing the scaling mode in the GPU control panel, the ``Scaling`` registry key is modified which align with the values in the [DISPLAYCONFIG_SCALING enum](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ne-wingdi-displayconfig_scaling) documentation. The comments below indicate what the GPU control panel options correspond to.

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Configuration\<id>]
"Scaling"=dword:00000002
```

```cpp
typedef enum {
    DISPLAYCONFIG_SCALING_IDENTITY = 1,
    DISPLAYCONFIG_SCALING_CENTERED = 2, // No scaling
    DISPLAYCONFIG_SCALING_STRETCHED = 3, // Full-screen
    DISPLAYCONFIG_SCALING_ASPECTRATIOCENTEREDMAX = 4, // Aspect ratio
    DISPLAYCONFIG_SCALING_CUSTOM = 5,
    DISPLAYCONFIG_SCALING_PREFERRED = 128,
    DISPLAYCONFIG_SCALING_FORCE_UINT32 = 0xFFFFFFFF
} DISPLAYCONFIG_SCALING;
```

As you can see above, there is no option in the GPU control panel that corresponds to ``DISPLAYCONFIG_SCALING_IDENTITY``. Consequently, people have resorted to changing the ``Scaling`` value to 1 manually in registry and claim to perceive a difference, but does this really set the scaling mode to identity scaling? Does changing the value even work when the native resolution is used? Isn't the identity scaling mode already being used with the native resolution? What other factors determine the scaling mode? After all, Microsoft states that this is a request for what scaling mode to use, it does not necessarily mean that it will be used.

All the questions above can be answered by simply retrieving the current scaling mode value with the data [QueryDisplayConfig](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-querydisplayconfig) returns then test what it is in different scenarios. The example program in the documentation can be used to display the current scaling mode by logging ``path.targetInfo.scaling`` to the console. Compiled binaries and the source code can be found in the QueryDisplayScaling repository.

The table below consists of my results after testing what the current scaling mode is with GPU/Display scaling, requesting different scaling modes and resolutions configured in the GPU control panel and [Custom Resolution Utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU).

```
PS C:\> .\QueryDisplayScaling.exe
Scaling Mode: 2
```

<table style="text-align: center;">
    <tr>
        <td rowspan="2">Peform Scaling On</td>
        <td rowspan="2">Requested Scaling Mode</td>
        <td colspan="3">Actual Scaling Mode</td>
    </tr>
    <tr>
        <td>Native (1920x1080)</td>
        <td>GPU Control Panel (1280x720)</td>
        <td>CRU (1280x720)</td>
    </tr>
    <tr>
        <td rowspan=4>GPU</td>
        <td>Identity (1)</td>
        <td>Identity (1)</td>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>No scaling (2)</td>
        <td>Identity (1)</td>
        <td>Centered (2)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>Full-screen (3)</td>
        <td>Identity (1)</td>
        <td>Full-screen (3)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td rowspan=4>Display</td>
        <td>Identity (1)</td>
        <td>Identity (1)</td>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>No scaling (2)</td>
        <td>Identity (1)</td>
        <td>Centred (2)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>Full-screen (3)</td>
        <td>Identity (1)</td>
        <td>Full-screen (3)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
    </tr>
</table>

- Conclusions:

  - No scaling in GPU control panel requests the Centered (2) scaling mode

  - Requesting to use the identity (1) scaling mode with GPU scaling resorts to the aspect ratio (4) scaling mode

  - An observation that isn't demonstrated in the table above is that, in my case, having two or more detailed resolutions in CRU while using ``Perform Scaling On: GPU`` along with the desired resolution not being topmost resolution resulted in the Centered, full-screen and aspect ratio scaling modes used (GPU scaling)

  - Due to the previous bullet point, the GPU/Display scaling option in the GPU control panel only makes a difference when using two or more detailed resolutions in CRU

  - Different combinations of settings can result in the same outcome

  - You can determine whether you are using identity scaling by checking if the resolution listed in the monitor OSD matches the desktop resolution. Otherwise, you are GPU scaling
