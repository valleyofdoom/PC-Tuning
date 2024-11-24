# PC-Tuning

> [!CAUTION]
> In order of performance scaling, Hardware > BIOS > Operating System.

> [!CAUTION]
> **Do NOT** blindly trust or believe everything you read online (including this resource) and typically doubt everything. Instead, validate statements through evidence, research and benchmarks.

> [!CAUTION]
> **Do NOT** apply random, unknown or undocumented changes, programs and script to your system without a comprehensive understanding of what they are changing and impact they have on security, privacy and performance.

<h1 id="table-of-contents">1. Table of Contents</h1>

- [1. Table of Contents](#table-of-contents)
- [2. Introduction](#introduction)
- [3. Benchmarking](#benchmarking)
- [4. Physical Setup](#physical-setup)
- [5. Cooling](#cooling)
- [6. BIOS/UEFI](#biosuefi)
  - [6.1. Partition Style](#partition-style)
  - [6.2. Consider Windows Version](#consider-windows-version)
  - [6.3. BIOS Recovery Methods](#bios-recovery-methods)
  - [6.4. BIOS Updates](#bios-updates)
  - [6.5. BIOS Microcode](#bios-microcode)
  - [6.6. Accessing Hidden Options](#accessing-hidden-options)
  - [6.7. Unnecessary Devices](#unnecessary-devices)
  - [6.8. Resizable Bar (ReBAR)](#resizable-bar)
  - [6.9. Hyper-Threading/Simultaneous Multithreading](#hyper-threadingsimultaneous-multithreading)
  - [6.10. Power States](#power-states)
  - [6.11. Virtualization/SVM Mode](#virtualizationsvm-mode)
  - [6.12. Power-Saving](#power-saving)
  - [6.13. Trusted Platform Module (TPM)](#trusted-platform-module-tpm)
  - [6.14. Compatibility Support Module (CSM)](#compatibility-support-module-csm)
  - [6.15. Secure Boot](#secure-boot)
  - [6.16. Fast Startup, Standby and Hibernate](#fast-startup-standby-and-hibernate)
  - [6.17. Spread Spectrum](#spread-spectrum)
  - [6.18. Legacy USB Support](#legacy-usb-support)
  - [6.19. Software Installation Options](#software-installation-options)
  - [6.20. PCI Link Speed for Devices](#pci-link-speed-for-devices)
  - [6.21. Fan Curves](#fan-curves)
  - [6.22. BIOS Profiles and Backups](#bios-profiles-and-backups)
- [7. Configure USB Port Layout](#configure-usb-port-layout)
  - [7.1. Reviewing Accessible USB Ports](#reviewing-accessible-usb-ports)
  - [7.2. Layout Planning](#layout-planning)
  - [7.3. Plugging In Devices](#plugging-in-devices)
- [8. Configure Peripherals](#configure-peripherals)
  - [8.1. Cleaning](#cleaning)
  - [8.2. Onboard Memory Profiles](#onboard-memory-profiles)
  - [8.3. RGB Lighting Effects](#rgb-lighting-effects)
  - [8.4. DPI](#dpi)
  - [8.5. Report Rate](#report-rate)
  - [8.6. Polling Stability Analysis](#polling-stability-analysis)
  - [8.7. Monitor](#monitor)
- [9. Stability, Hardware Clocking and Thermal Performance](#stability-hardware-clocking-and-thermal-performance)
  - [9.1. Temporary Operating System](#temporary-operating-system)
  - [9.2. General Information](#general-information)
  - [9.3. Error Correction](#error-correction)
  - [9.4. Thermal Management](#thermal-management)
  - [9.5. Load-line Calibration](#load-line-calibration)
  - [9.6. GPU](#gpu)
  - [9.7. RAM/CPU](#ramcpu)
  - [9.8. Stress-Testing Tools](#stress-testing-tools)
- [10. Install Windows](#install-windows)
  - [10.1. Storage Partitions](#storage-partitions)
  - [10.2. What Version of Windows Should You Use?](#what-version-of-windows-should-you-use)
  - [10.3. Downloading and Preparing a Stock Windows ISO](#downloading-and-preparing-a-stock-windows-iso)
  - [10.4. ISO Sources](#iso-sources)
  - [10.5. ISO Preparation](#iso-preparation)
  - [10.6. Fetching Required Files](#fetching-required-files)
  - [10.7. Booting Into the ISO](#booting-into-the-iso)
- [11. Configure Windows](#configure-windows)
  - [11.1 OOBE Setup](#oobe-setup)
  - [11.2. Unrestricted PowerShell Execution Policy](#unrestricted-powershell-execution-policy)
  - [11.3. Importing bin Folder](#importing-bin-folder)
  - [11.4. Process Mitigations (Windows 10 1709+)](#process-mitigations-windows-10-1709)
  - [11.5. Merging Registry Options](#merging-registry-options)
    - [11.5.1. Registry Options Documentation](#registry-options-documentation)
    - [11.5.2. Applying Options](#applying-options)
  - [11.6. Installing Drivers](#installing-drivers)
  - [11.7. Windows Server Specific Options (Windows Server)](#windows-server-specific-options-windows-server)
  - [11.8. Privacy Options (Windows 8+)](#privacy-options-windows-8)
  - [11.9. Search Indexing](#search-indexing)
  - [11.10. Time, Language and Region](#time-language-and-region)
  - [11.11. Web Browser](#web-browser)
  - [11.12. Scheduled Tasks](#scheduled-tasks)
  - [11.13. Activate Windows](#activate-windows)
  - [11.14. Declutter Interface](#declutter-interface)
  - [11.15. Visual Effects](#visual-effects)
  - [11.16. Superfetch and Prefetch](#superfetch-and-prefetch)
  - [11.17. Operating System and Partition Name](#operating-system-and-partition-name)
  - [11.18. Show Tray Icons](#show-tray-icons)
  - [11.19. Hibernation](#hibernation)
  - [11.20. Runtimes](#runtimes)
  - [11.21. Handling Bloatware](#handling-bloatware)
  - [11.22. Optional Features](#optional-features)
    - [11.22.1. NET 3.5](#net-35)
  - [11.23. 7-Zip](#7-zip)
  - [11.24. Graphics Driver](#graphics-driver)
  - [11.25. MSI Afterburner](#msi-afterburner)
  - [11.26. Display Resolutions and Scaling Modes](#display-resolutions-and-scaling-modes)
  - [11.27. Open-Shell (Windows 8+)](#open-shell-windows-8)
  - [11.28. Spectre, Meltdown and CPU Microcode](#spectre-meltdown-and-cpu-microcode)
  - [11.29. Power Options](#power-options)
  - [11.30. Process Explorer](#process-explorer)
  - [11.31. Memory Management Settings (Windows 8+)](#memory-management-settings-windows-8)
  - [11.32. Network Adapter Options](#network-adapter-options)
  - [11.33. Audio Devices](#audio-devices)
  - [11.34. Device Manager](#device-manager)
  - [11.35. Device Power-Saving](#device-power-saving)
  - [11.36. Event Trace Sessions (ETS)](#event-trace-sessions-ets)
  - [11.37. File System](#file-system)
  - [11.38. Message Signaled Interrupts](#message-signaled-interrupts)
  - [11.39. XHCI Interrupt Moderation (IMOD)](#xhci-interrupt-moderation-imod)
  - [11.40. Control Panel](#control-panel)
  - [11.41. Configuring Applications](#configuring-applications)
    - [11.41.1 NVIDIA Reflex](#nvidia-reflex)
    - [11.41.2 Framerate Limit](#framerate-limit)
    - [11.41.3. Register Game in Config Store](#register-game)
    - [11.41.4 Presentation Mode](#presentation-mode)
    - [11.41.5. Game Mode](#game-mode)
    - [11.41.6. Media Player](#media-player)
    - [11.41.7. QoS Policies](#qos-policies)
  - [11.42. Kernel-Mode Scheduling (Interrupts, DPCs and more)](#kernel-mode-scheduling-interrupts-dpcs-and-more)
    - [11.42.1. GPU and DirectX Graphics Kernel](#gpu-and-directx-graphics-kernel)
    - [11.42.2. XHCI and Audio Controller](#xhci-and-audio-controller)
    - [11.42.3. Network Interface Card](#network-interface-card)
  - [11.43. User-Mode Scheduling (Processes, Threads)](#user-mode-scheduling-processes-threads)
    - [11.43.1. Starting a Process with a Specified Affinity Mask](#starting-a-process-with-a-specified-affinity-mask)
    - [11.43.2. Specifying an Affinity Mask for Running Processes](#specifying-an-affinity-mask-for-running-processes)
  - [11.44. Reserved CPU Sets (Windows 10+)](#reserved-cpu-sets-windows-10)
    - [11.44.1. Use Cases](#use-cases)
  - [11.45. Analyzing Event Viewer](#analyzing-event-viewer)
  - [11.46. Virtualization Based Security (VBS)](#virtualization-based-security-vbs)
  - [11.47. CPU Idle States](#cpu-idle-states)
    - [11.47.1. Enable Idle States (default)](#enable-idle-states-default)
    - [11.47.2. Disable Idle States](#disable-idle-states)
  - [11.48. Thread Quantums and Scheduling](#thread-quantums-and-scheduling)
    - [11.48.1. Bitmask Explaination](#bitmask-explaination)
    - [11.48.2. Win32PrioritySeparation Values](#win32priorityseparation-values)
  - [11.49. Clock Interrupt Frequency (Timer Resolution)](#clock-interrupt-frequency-timer-resolution)
  - [11.50. Paging File](#paging-file)
  - [11.51. Cleanup and Maintenance](#cleanup-and-maintenance)

<h1 id="introduction">2. Introduction</h1>

This resource can be used to whatever extent you prefer, but be sure to heed the warnings. The primary objective of this resource is to utilize an evidence-oriented approach to explore practices for tuning Windows-based systems for a variety of use cases, covering hardware, operating system, and software configurations. If your daily workflow allows for Linux, then use it. Linux offers far more flexibility than Windows ever will in various aspects. Especially for "power users". This resource is designed to accommodate a broad audience, addressing various goals such as enhancing security and privacy however, it generally favors and caters for gaining a competitive edge in games and executing real-time tasks. There is a strong emphasis on encouraging users to make the changes themselves, with minimal use of scripts to ensure transparency and prevent unintended modifications to the reader's system.

The reader is expected to follow the sections in sequential order as subsequent steps are contingent upon the completion of preceding steps. Therefore, each section is numbered.

<h2 id="other-resources">2.1. Other Resources</h2>

- [BoringBoredom/PC-Optimization-Hub](https://github.com/BoringBoredom/PC-Optimization-Hub)
- [Calypto's Latency Guide](https://calypto.us)
- [djdallmann/GamingPCSetup](https://github.com/djdallmann/GamingPCSetup)
- Windows Internals, Part 1: System Architecture, Processes, Threads, Memory Management, and More
- Windows Internals, Part 2

<h1 id="benchmarking">3. Benchmarking</h1>

Benchmarking is employed to objectively assess and eliminate the influence of potential placebo effects in system modifications while evaluating the quality or characteristic of a given change. In the context of this resource, it typically refers to measuring performance scaling after making certain changes to your system. It is important to learn and understand what is involved in the benchmarking process as you will need to carry out your own experiments to assist in decision-making such as identifying whether a certain change results in a performance regression or what settings to use in-game. For given changes, ask yourself questions such as "*What am I trying to achieve?*", "*What is my goal?*", "*What am I trying to improve with this change?*", "*What is this change supposed to affect?*", "*How can the effects of this change be measured and demonstrated?*".

- [FrameView](https://www.nvidia.com/en-gb/geforce/technologies/frameview) - [PC Latency](https://images.nvidia.com/content/images/article/system-latency-optimization-guide/nvidia-latency-optimization-guide-pc-latency.png) in games that support [PC Latency Stats](https://www.nvidia.com/en-gb/geforce/technologies/reflex/supported-products) and frame pacing
- [Frame Latency Meter](https://github.com/GPUOpen-Tools/frame_latency_meter)
- [PresentMon](https://boringboredom.github.io/Frame-Time-Analysis) - Various metrics such as frame pacing and [GPU Busy](https://www.intel.com/content/www/us/en/docs/gpa/user-guide/2022-4/gpu-metrics.html). See a full list [here](https://github.com/GameTechDev/PresentMon/blob/main/README-CaptureApplication.md#metric-definitions)
- [Windows Performance Toolkit](https://learn.microsoft.com/en-us/windows-hardware/test/wpt) - Advanced performance analysis library for Windows. Extract ISR/DPC execution time data with [xperf](/bin/xperf-dpcisr.bat)
- [Mouse Tester](https://github.com/valleyofdoom/MouseTester) - Mice performance metrics (e.g. polling interval, X/Y counts and more plots against time)
- [NVIDIA Reflex Analyzer](https://www.nvidia.com/en-gb/geforce/news/reflex-latency-analyzer-360hz-g-sync-monitors) - End-to-end latency
- [Frame-Time-Analysis](https://boringboredom.github.io/Frame-Time-Analysis) - Analyze CSV data logged by the programs mentioned above including 1%, 0.1% lows metrics
- [Latency Grapher](https://boringboredom.github.io/tools/latencygrapher) - Analyze latency results from RLA, FrameView and PresentMon

<h1 id="physical-setup">4. Physical Setup</h1>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

- New installations of Windows are recommended after major hardware changes including but not limited to motherboards, CPUs, platforms and chipsets

- See [Higher Airflow Cases | Calypto](https://docs.google.com/spreadsheets/d/14Kt2cAn8a7j2sGXiPGt4GcxpR3RXVcDAx9R5c2M8680/edit#gid=0)

- Avoid multi-CCX/CCD Ryzen CPUs due to the latency penalty incurred from inter-CCX/CCD communication ([1](https://calypto.us), [2](https://www.anandtech.com/show/17585/amd-zen-4-ryzen-9-7950x-and-ryzen-5-7600x-review-retaking-the-high-end/10))

- See [Low Latency Hardware | Calypto](https://calypto.us)

- Avoid overtightening screws

- Verify whether all connectors are seated properly and that none are loose (e.g. PSU cables)

- Disconnect unnecessary and unused devices from your setup including peripherals, LEDs, RGB light strips, USB devices, storage drives, wireless receivers and more

- Favor wired over cordless devices (e.g. peripherals, Ethernet) due to the degraded performance and inconsistency associated with wireless devices, aggressive power-saving features for a longer battery life along with the downside of being negatively affected by interference and transmission overhead ([1](https://www.meetion.com/a-the-impact-of-lift-off-distance-on-battery-life-with-wireless-vs-wired-gaming-mice.html), [2](https://en.wikipedia.org/wiki/2.4_GHz_radio_use), [3](https://raw.githubusercontent.com/BoringBoredom/PC-Optimization-Hub/main/content/peripherals/wireless%20overhead.png), [4](https://www.logitechg.com/en-gb/innovation/hero.html), [5](https://www.youtube.com/watch?v=Zn7WjyIvAWA))

- An SSD or NVMe storage is strongly recommended due to the degraded performance ([1](https://unihost.com/help/nvme-vs-ssd-vs-hdd-overview-and-comparison)) and excessive interference of HDDs. Ensure that there is always a sufficient amount of free space as SSDs slow down as they are filled up ([1](https://www.howtogeek.com/165542/why-solid-state-drives-slow-down-as-you-fill-them-up)) however most drives are overprovisioned from factory ([1](https://download.semiconductor.samsung.com/resources/white-paper/S190311-SAMSUNG-Memory-Over-Provisioning-White-paper.pdf), [2](https://www.techpowerup.com/ssd-specs/samsung-980-pro-1-tb.d47))

- Assess the condition and performance of storage devices with [CrystalDiskInfo](https://crystalmark.info/en/software/crystaldiskinfo) and [CrystalDiskMark](https://crystalmark.info/en/software/crystaldiskmark) to determine whether they require replacement or maintenance

- Check and update firmware for devices including but not limited to NVMe, NICs, peripherals and more. Beware of problems brought up in reviews and forums regarding specific firmware versions if applicable

- Install the RAM in the correct slots by referring to the motherboard manual. Consider the memory trace layout when determining the amount of sticks to use

  - See [Motherboard Memory Layouts | buildzoid](https://www.youtube.com/watch?v=3vQwGGbW1AE)

- Favor PCIe ports that are connected directly to the CPU rather than chipset. This typically applies to M.2, NVMe drives and GPUs. This can be determined with the PCIe Bus category in [HWiNFO](https://www.hwinfo.com). Additionally, ensure that all your PCIe devices under the PCIe Bus category are running at their rated specification such as ``x16 3.0`` ([example](/assets/images/hwinfo-pcie-width-speed.png)). The current link width/speed of the device should match the maximum supported by the device. For certain devices such as GPUs, the link speed may decrease when idling. In these situations, place the device under load to get a meaningful reading

- IRQ sharing is problematic and is a source of high interrupt latency ([1](https://repo.zenk-security.com/Linux%20et%20systemes%20d.exploitations/Windows%20Internals%20Part%201_6th%20Edition.pdf)). IRQ conflicts can be assessed by typing ``msinfo32`` in ``Win+R`` then navigating to the Conflicts/Sharing section.  The causes may be due to the hardware or software configuration. To isolate potential hardware-related causes, enable [Message Signaled Interrupts](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044) on the problematic device then restart the system. If the device still shares an IRQ, this can indicate incorrectly configured hardware

- If multiple onboard Ethernet NICs are present, consider using the one that supports MSI-X by checking in [MSI Utility](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044) or [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy) as it is required for Receive Side Scaling to function properly ([1](https://old.reddit.com/r/intel/comments/9uc03d/the_i219v_nic_on_your_new_z390_motherboard_and)). This can be achieved by plugging the Ethernet cable into the port that corresponds to the desired NIC on the motherboard

- Measure and minimize bufferbloat as it is a cause of high latency and jitter in packet-switched networks caused by excess buffering of packets ([1](https://en.wikipedia.org/wiki/Bufferbloat), [2](https://www.bufferbloat.net/projects))

  - See [Waveform Bufferbloat and Internet Speed Test | Waveform](https://www.waveform.com/tools/bufferbloat)
  - See [How to test your Internet Ping (PingPlotter) | Netduma](https://support.netduma.com/support/solutions/articles/16000074717-how-to-test-your-internet-ping)
  - See [What Can I Do About Bufferbloat? | Bufferbloat.net](https://www.bufferbloat.net/projects/bloat/wiki/What_can_I_do_about_Bufferbloat)
  - See [stoplagging.com](https://www.stoplagging.com)

- Avoid daisy-chaining power cables anywhere in your setup

  - See [Installation Remark for High Power Consumption Graphics Cards | Seasonic](https://knowledge.seasonic.com/article/8-installation-remark-for-high-power-consumption-graphics-cards)

- Favor shielded cables and avoid unnecessarily long ones as they offer more protection against interference ([1](https://precmfgco.com/blog/shielded-vs-unshielded-cables))

- Ensure that there is a moderate amount of space between cables to reduce the risk of [coupling](https://en.wikipedia.org/wiki/Coupling_(electronics))

- Clean dust from components and heat sinks as they have the potential to cause short circuits and reduce airflow ([1](https://www.armagard.co.uk/articles/dust-computer-killer.html)). Be careful in regard to voltage feedback to the motherboard when dusting case fans

- Clean the contact pins and connectors of components. Use compressed air to remove dust from slots before installing components such as PCIe, NVMe, RAM and more

- Insert the display cable into the discrete GPU if present instead of the motherboard

- Minimize GPU sag with an anti-sag bracket or similar to prevent damage to the PCIe contacts and the slot itself

- Multi-monitor setups have the potential to introduce processing overhead ([1](https://www.youtube.com/watch?v=5wBxYQdN96s))

<h1 id="cooling">5. Cooling</h1>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

- If you plan on overclocking, consider the points below to maximize temperature headroom and overclocking potential. It is important to note that lower temperatures can affect other variables even if you are not overclocking such as CPU boosting behavior as the boosting algorithm is affected by temperature and much more

  - Remove the side panels from your case as they tend to trap heat or consider an open-bench setup (beware of dust)
  - Delid your CPU and use liquid metal for a significant thermal improvement depending on the quality of the IHS ([1](https://www.youtube.com/watch?v=rUy3WcDlBXE)). Direct die and lapping are also worth considering however users should assess the risk with carrying out these procedures
  - Avoid tower and air coolers due to limited cooling potential ([1](https://www.youtube.com/watch?v=Vex9_84VpYs)) and lack of space for fans to cool other components such as RAM and VRMs
  - Remove the heat sink from your RAM as they tend to trap heat due to them being attached to the PCB with foam or glue ([1](https://i.imgur.com/7KvbxTv.jpg)). Replace them with higher quality heat sinks and pads as hotspots can incur with naked RAM. Get creative with mounting a fan (140mm recommended) over them using cable ties
  - Mount a fan over VRMs, PCH and other hot spots
  - Replace thermal pads with higher-quality ones if the stock pads are inadequate
  - Reapply the thermal interface material on the GPU due to factory application of it often being inadequate and optionally replace the stock fans with higher quality ones

- Consider contact frames and offset mounts if applicable

  - See [Investigating Intel’s CPU Socket Problems | Thermal Grizzly Contact Frame Benchmark | Gamers Nexus](https://www.youtube.com/watch?v=Ysb25vsNBQI)
  - See [Noctua Releases Offset Mounting for Improved Cooling Performance on AMD AM5 CPUs | Noctua](https://noctua.at/en/noctua-releases-offset-mounting-for-improved-cooling-performance-on-amd-am5-processors)

- Use high-quality thermal interface material and an adequate amount upon application

  - See [Best Thermal Paste for CPUs | Tom’s Hardware](https://www.tomshardware.com/best-picks/best-thermal-paste)

- Assess contact patches on the IHS/Die and cold plate

- Mount your AIO cooler properly

  - See [Stop Doing It Wrong: How To Kill Your CPU Cooler | Gamers Nexus](https://www.youtube.com/watch?v=BbGomv195sk)

- Use non-RGB fans while favoring ones with a high static pressure as mesh filters, radiators, heatsink fins and more obstruct airflow

  - See [PC Fans | Calypto](https://docs.google.com/spreadsheets/d/1AydYHI_M6ov9a3OgVuYXhLEGps0J55LniH9htAHy2wU)

- Ensure not to overload the motherboard fan header, especially if you are using fan splitters

- Use an M.2/NVMe heat sink to reduce temperatures ([1](https://cdn.mos.cms.futurecdn.net/mftAb4ExpeZiqVnuHrAqwf-970-80.png)) and optionally mount a fan over it

<h1 id="biosuefi">6. BIOS/UEFI</h1>

As a general rule of thumb, ensure that the settings you are changing results in positive performance scaling and make note of them for future reference/backtracking to resolve potential issues. I would recommend resetting settings to factory defaults to work with a clean slate in case anything was misconfigured initially.

<h2 id="partition-style">6.1. Partition Style</h2>

If you aren't already using the partition style you would like to be using, you should switch now because some settings listed in this section depend on the partition style (search for *"GPT/UEFI"* in this section). GPT/UEFI is recommended for most systems as it offers the most compatibility ([1](https://www.diskpart.com/gpt-mbr/mbr-vs-gpt-1004.html)). The current partition style can be determined by typing ``msinfo32`` in ``Win+R``. The recommended method to convert the partition style is to wipe and convert the disk using diskpart within Windows setup ([1](https://learn.microsoft.com/en-us/windows-server/storage/disk-management/change-an-mbr-disk-into-a-gpt-disk)).

- See [How To Convert MBR to GPT During Windows 10/8/7 Installation | MDTechVideos](https://www.youtube.com/watch?v=f81qKAJUdKc)

<h2 id="consider-windows-version">6.2. Consider Windows Version</h2>

Consider what Windows version you will be using because some settings listed in this section depend on the Windows version being used (search for *"Windows"* in this section). Read section [What Version of Windows Should You Use?](#what-version-of-windows-should-you-use) to help decide which version best suits your requirements.

<h2 id="bios-recovery-methods">6.3. BIOS Recovery Methods</h2>

Modifying BIOS is never without risks. Explore methods to flash a stock BIOS such as USB flashback or a [CH341A](https://www.techinferno.com/index.php?/topic/12230-some-guide-how-to-use-spi-programmer-ch341a) programmer if [clearing CMOS](https://www.intel.co.uk/content/www/uk/en/support/articles/000025368/processors.html) does not restore everything to its original state.

<h2 id="bios-updates">6.4. BIOS Updates</h2>

Check for BIOS updates and positive changes in the change logs (e.g. increased memory stability). Beware of problems brought up in reviews and forums regarding specific BIOS versions if applicable.

<h2 id="bios-microcode">6.5. BIOS Microcode</h2>

> [!WARNING]
> 🔒 Upgrading or downgrading microcode may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

On much older platforms and CPUs, BIOS-level Spectre, Meltdown and other CPU microcode patches had the ability to drastically influence performance which isn't so much the case with modern systems nowadays. [CPU-Z's](https://www.cpuid.com/softwares/cpu-z.html) validation feature exposes the microcode version and it was possible to manipulate microcode and their versions within the BIOS using tools such as [MMTool](https://www.ami.com/blog/2017/10/30/what-is-mmtool). Nonetheless, this is not necessarily required to be changed on modern platforms and is here as an informative note.

<h2 id="accessing-hidden-options">6.6. Accessing Hidden Options</h2>

Motherboard vendors hide and lock a lot of settings so that they aren't visible to a regular user. For clarification, unlocking BIOS corresponds to making hidden settings visible and accessible. The easiest approach to take is to change the access levels within the BIOS using [UEFI-Editor](https://github.com/BoringBoredom/UEFI-Editor#usage-guide) then flash it which will result in hidden options available in the UEFI. An alternative approach is to configure what is already accessible in UEFI then access hidden options by reading and writing to NVRAM using [GRUB](https://github.com/BoringBoredom/UEFI-Editor#how-to-change-hidden-settings-without-flashing-a-modded-bios) ([script generator](https://github.com/ab3lkaizen/setupvar-builder)) or [SCEWIN](https://github.com/ab3lkaizen/SCEHUB).

<h2 id="unnecessary-devices">6.7. Unnecessary Devices</h2>

Generally, follow the rule of "If you're not using it, disable it". It is preferable to physically disconnect components if possible, but this typically includes NICs, WLAN, Bluetooth, High Definition Audio (if you are not utilizing motherboard audio) controllers, integrated graphics, SATA, RAM slots, onboard devices visible in [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html) (e.g. LED controllers, IR receivers) and more. Keep in mind that some motherboards have the High Definition Audio controller linked to the USB controller ([1](https://www.igorslab.de/en/the-old-alc4080-on-the-new-intel-boards-demystified-and-the-differences-from-alc1220-insider)) so don't get confused if this is encountered in the USB device tree.

<h2 id="resizable-bar">6.8. Resizable Bar (ReBAR)</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

See [this](https://www.howtogeek.com/819578/what-is-resizable-bar-on-a-gpu) for an overview of what Resizable Bar is. It is worth noting that ReBAR can result in a performance regression in some games ([1](https://www.techspot.com/review/2234-nvidia-resizable-bar)) so carry out your own benchmarks.

ReBAR requires the GPT/UEFI BIOS mode and `Above 4G Decoding` to be enabled. For unsupported motherboards, consider viewing [ReBarUEFI](https://github.com/xCuri0/ReBarUEFI)/[NvStrapsReBar](https://github.com/terminatorul/NvStrapsReBar). To verify that Resizable Bar is enabled, check the status with [GPU-Z](https://www.techpowerup.com/gpuz).

<h2 id="hyper-threadingsimultaneous-multithreading">6.9. Hyper-Threading/Simultaneous Multithreading</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

If you have enough CPUs for your application then consider disabling [Hyper-Threading (HT)/Simultaneous Multithreading (SMT)](https://en.wikipedia.org/wiki/Hyper-threading). This feature is beneficial for highly threaded operations such as encoding, compiling and rendering however using multiple execution threads per CPU increases contention on processor resources and is a potential source of system latency and jitter ([1](https://www.intel.com/content/www/us/en/developer/articles/technical/optimizing-computer-applications-for-latency-part-1-configuring-the-hardware.html)). Disabling HT/SMT has the additional benefit of increased overclocking potential due to lower temperatures which can affect performance positively or negatively in some games hence, I would recommend benchmarking these options thoroughly and not blindly disabling them.

<h2 id="power-states">6.10. Power States</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

To be completed.

<h2 id="virtualizationsvm-mode">6.11. Virtualization/SVM Mode</h2>

Disable [Virtualization/SVM Mode](https://en.wikipedia.org/wiki/Desktop_virtualization) and [Intel VT-d/AMD-Vi](https://en.wikipedia.org/wiki/X86_virtualization#I/O_MMU_virtualization_(AMD-Vi_and_Intel_VT-d)) if applicable as they can cause a difference in latency for memory access ([1](https://web.archive.org/web/20190403122634/https://www.amd.com/system/files/TechDocs/56263-EPYC-performance-tuning-app-note.pdf)). Virtualization also has the potential to affect BCLK ([1](https://linustechtips.com/topic/1479168-issue-enabling-svm-virtualization-causes-bclk-to-fluctuate-a-lot)). The virtualization status can be verified using Task Manager's CPU section.

<h2 id="power-saving">6.12. Power-Saving</h2>

Power-saving has no place on a machine executing real-time tasks. These features can be named differently, including but not limited to [ASPM (Active State Power Management)](https://en.wikipedia.org/wiki/Active_State_Power_Management) (e.g. search for *L0*, *L1*), [ALPM (Aggressive Link Power Management)](https://en.wikipedia.org/wiki/Aggressive_Link_Power_Management), Power/Clock Gating and more. You can also look out for options named *power management* or *power saving*. Search the internet if you are unsure whether a given setting is power-saving related.

<h2 id="trusted-platform-module-tpm">6.13. Trusted Platform Module (TPM)</h2>

> [!WARNING]
> 🔒 Disabling TPM may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Disable Trusted Platform Module as it may cause the system to enter System Management Mode (SMM) via System Management Interrupts (SMIs) ([1](https://youtu.be/X72LgcMpM9k?si=A5Kl5NmU5f1WzZP4&t=2060)) which are high priority unmaskable hardware interrupts which cause the CPU to immediately suspend all other activities, including the operating system ([1](https://wiki.linuxfoundation.org/realtime/documentation/howto/debugging/smi-latency/smi)). On Windows 11, a minority of anticheats (Vanguard, FACEIT) require it to be enabled and its status can be verified by typing ``tpm.msc`` in ``Win+R``.

<h2 id="compatibility-support-module-csm">6.14. Compatibility Support Module (CSM)</h2>

MBR/Legacy requires Compatibility Support Module to be enabled and typically, only the storage and PCIe OpROMs are required, but you can enable all of them if you are unsure. Disable CSM if you are using GPT/UEFI with the exception being Windows 7 GPT/UEFI as it requires CSM and OpROMs unless you are using [uefiseven](https://github.com/manatails/uefiseven). Disable CSM if you are using Resizable Bar.

<h2 id="secure-boot">6.15. Secure Boot</h2>

> [!WARNING]
> 🔒 Disabling Secure Boot may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

On Windows 11, a minority of anticheats (Vanguard, FACEIT, THE FINALS) require Secure Boot to be enabled. If something fails due to Secure Boot being enabled such as bootable tools, I recommended temporarily disabling it rather than resorting to alternative solutions such as enrolling keys as they can lead to issues. If Secure Boot is not required, it can be disabled to avoid various issues. Its status can be verified by typing ``msinfo32`` in ``Win+R``.

<h2 id="fast-startup-standby-and-hibernate">6.16. Fast Startup, Standby and Hibernate</h2>

This boils down to personal preference, perceptions and experiences however, some individuals prefer not to utilize features such as Fast Startup, standby and hibernation, as they can lead to unexpected issues ([explanation](https://www.youtube.com/watch?v=OBGxt8zhbRk)), while preferring to perform clean system boots instead of saving and restoring kernel and software state thus limiting the system power states to S0 (working state) and S5 (soft off). Learn about system power states and their meaning [here](https://learn.microsoft.com/en-us/windows/win32/power/system-power-states) and [here](https://www.sciencedirect.com/topics/computer-science/sleeping-state). These options in BIOS are often named Fast Startup, Suspend to RAM, S-States (search for *S1*, *S2*, *S3*, *S4*, *S5*), standby or similar options. S-State status can be verified with ``powercfg /a`` in CMD.

Windows also has a toggle that disables Fast Startup, hibernation and removes ``C:\hiberfil.sys``:

```bat
powercfg /h off
```

<h2 id="spread-spectrum">6.17. Spread Spectrum</h2>

Disable Spread Spectrum ([read more](https://en.wikipedia.org/wiki/Spread_spectrum#Effect)) and ensure BCLK frequency is close to the desired value as possible (e.g. 100MHz not 99.97MHz) in [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html) however, this highly dependent on the system and motherboard.

<h2 id="legacy-usb-support">6.18. Legacy USB Support</h2>

Disable Legacy USB Support as it may cause the system to enter System Management Mode (SMM) via System Management Interrupts (SMIs) ([1](https://patents.google.com/patent/US6067589), [2](https://www.kernel.org/doc/Documentation/x86/usb-legacy-support.txt)) which are high priority unmaskable hardware interrupts which cause the CPU to immediately suspend all other activities, including the operating system ([1](https://wiki.linuxfoundation.org/realtime/documentation/howto/debugging/smi-latency/smi)). You may need to turn this on to install a new operating system, access BIOS or USB devices in some cases.

<h2 id="software-installation-options">6.19. Software Installation Options</h2>

If there are options relating to software installation (e.g. ASUS Armoury Crate), then disable them. These types of software are typically in-line with other bloatware which can safely be avoided and are present in various BIOSes ([ASUS](https://www.asus.com/support/faq/1043788), [Gigabyte](https://old.reddit.com/r/gigabyte/comments/106d9ns/gigabyte_control_center_prompt_to_install_every/ja0gc6l), [MSI](https://old.reddit.com/r/MSI_Gaming/comments/14s7so7/how_to_disable_autoinstall_of_msi_center/l6zoigh), [ASRock](https://old.reddit.com/r/ASRock/comments/1bxf8jt/asrock_auto_driver_install_app/kyc904r)).

<h2 id="pci-link-speed-for-devices">6.20. PCI Link Speed for Devices</h2>

Set PCIe link speed to the maximum supported such as ``Gen 4.0``. This may be represented as gigatransfers per second (GT/s) ([1](https://en.wikipedia.org/wiki/PCI_Express#Comparison_table)). This helps with alleviating unexpected behavior and issues.

<h2 id="fan-curves">6.21. Fan Curves</h2>

To maximize cooling potential, configure fan curves ([example](https://imgur.com/a/2UDYXp0)) or set a static, high, noise-acceptable RPM. Set your AIO pump speed to full if applicable.

<h2 id="bios-profiles-and-backups">6.22. BIOS Profiles and Backups</h2>

Backup BIOS by saving the current settings to a profile or export one to local storage as clearing CMOS will wipe all settings if you need to do so (e.g. while overclocking).

In my experience on various motherboards, loading a saved profile fails to restore certain settings after clearing CMOS. I would recommend dumping NVRAM using a tool such as [SCEWIN](https://github.com/ab3lkaizen/SCEHUB) so that when you restore a profile, dump NVRAM again then compare it to the previous/original export to see whether anything failed to restore by using a text comparison tool such as the [Notepad++ Compare plugin](https://sourceforge.net/projects/npp-compare) or [Visual Studio Code](https://code.visualstudio.com/download).

<h1 id="configure-usb-port-layout">7. Configure USB Port Layout</h1>

<h2 id="reviewing-accessible-usb-ports">7.1. Reviewing Accessible USB Ports</h2>

Firstly, familiarize yourself with which USB ports correspond to given USB controllers as some ports shown in [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html) may not be physically accessible. I recommended plugging a device into every accessible port on your system such as the ones on the motherboard I/O and front panels, then take a note of which controller and port each physical port corresponds to in USB Device Tree Viewer.

<h2 id="layout-planning">7.2. Layout Planning</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Secondly, plan and decide which USB controllers you would like to plug devices into but don't plug them in yet. As for which USB controllers should be used, that is up to you. If you have more than one USB controller, you can isolate devices such as your mouse, keyboard and audio devices onto another USB controller as they have the potential to interfere with polling consistency ([1](https://forums.blurbusters.com/viewtopic.php?f=10&t=7618#p58449)). More USB controllers may be made available by using PCIe expansion cards or external USB 2.0 and 3.0 headers on your motherboard. Always verify with [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html). Ryzen systems have a USB controller that is directly connected to the CPU ([1](https://hexus.net/tech/features/mainboard/131789-amd-ryzen-3000-supporting-x570-chipset-examined)) which can be identified under the PCIe Bus category in [HWiNFO](https://www.hwinfo.com). It is usually the USB controller that is connected to an ``Internal PCIe Bridge to bus`` which is also labelled with the CPU architecture ([example](/assets/images/ryzen-cpu-usb-controller.png)).

<h2 id="plugging-in-devices">7.3. Plugging In Devices</h2>

Lastly, plug the devices into the ports and USB controllers that you have decided to use. In any case, consider populating ones that are closest to the root of the USB controller's hub tree first. Additionally, I would also recommend avoiding internal hubs ([example](/assets/images/usb-hub-internal-headers.png)).

<h1 id="configure-peripherals">8. Configure Peripherals</h1>

<h2 id="cleaning">8.1. Cleaning</h2>

Carefully use an [air dust blower](https://www.amazon.com/s?k=air+dust+blower) to remove dirt and debris from the mouse sensor lens without damage.

<h2 id="onboard-memory-profiles">8.2. Onboard Memory Profiles</h2>

Most modern peripherals support onboard memory profiles such as mice and keyboards. Configure them before configuring the OS as you will not be required to install the bloatware such as Razer Synapse to change the settings later. Details for separating bloat-free and bloated environments using a dual-boot will be discussed in later steps. Alternatively, limit the bloated software to a bootable Windows USB ([Windows To Go](https://www.youtube.com/watch?v=w34x1kBZN6c)).

<h2 id="rgb-lighting-effects">8.3. RGB Lighting Effects</h2>

USB 2/3 are limited to 0.5A/0.9A respectively ([1](https://en.wikipedia.org/wiki/USB)) and RGB requires unnecessary power. Turn off lighting effects or strip the LED from the peripheral as running an RGB effect/animation can take a great toll on the MCU and will delay other processes ([1](https://wooting.io/post/what-influences-keyboard-speed), [2](https://www.techpowerup.com/review/endgame-gear-xm1-rgb/5.html#:~:text=tracking%20quality%20takes%20a%20hit%20as%20soon%20as%20RGB%20is%20enabled), [3](https://www.techpowerup.com/review/roccat-kone-pro-air/5.html#:~:text=after%20having%20disabled%20all%20RGB%20lighting,%20these%20outliers%20disappeared%20entirely)).

<h2 id="dpi">8.4. DPI</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Higher sensor DPI reduces latency and helps in saturating polls with motion data ([1](https://www.youtube.com/watch?v=6AoRfv9W110), [2](https://www.youtube.com/watch?v=mwf_F2VboFQ&t=458s), [3](https://www.youtube.com/watch?v=imYBTj2RXFs&t=275s)). Avoid jitter reduction (e.g. DPI downshift) and [sensor smoothing](https://old.reddit.com/r/MouseReview/comments/5haxn4/sensor_smoothing) kicking in with higher DPI values. If your game uses raw input, you can [reduce the pointer speed](https://boringboredom.github.io/tools/winsenscalculator) in Windows to offset the sensitivity from higher DPI. Otherwise, leave the slider at the default position as input will be negatively affected due to scaling. One way to determine whether a given application is using raw input is to spy on the raw input API calls with [API Monitor](http://www.rohitab.com/apimonitor) or check whether the ``enhance pointer precision`` option has any effect in-game. If you are still unsure or have doubts, leave the slider at the default position.

<h2 id="report-rate">8.5. Report Rate</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Higher polling rates reduce jitter and latency ([1](https://www.youtube.com/watch?app=desktop&v=djCLZ6qEVuA), [2](https://www.youtube.com/watch?v=mwf_F2VboFQ&t=458s), [3](https://www.youtube.com/watch?v=mwf_F2VboFQ&t=618s)). Higher polling rates may negatively impact performance depending on your hardware and general configuration so adjust accordingly.

<h2 id="polling-stability-analysis">8.6. Polling Stability Analysis</h2>

Use [Mouse Tester](https://github.com/valleyofdoom/MouseTester) to check whether each poll contains data. As an example, if the interval is spiking to 2ms (500Hz) or higher from 1ms (1kHz), this is not the expected behavior and is problematic. This may be due to several variables such as the device itself (e.g. sensor fault), cable, power issues, hardware, operating system and more. You may need to lower or disable USB interrupt moderation using the [XHCI-IMOD-Interval.ps1](/bin/XHCI-IMOD-Interval.ps1) script if there are multiple devices generating interrupts on the same USB controller and/or the mouse interrupts are being generated at a rate greater than or equal to the default IMOD interval during the benchmark resulting in IMOD kicking in.

<h2 id="monitor">8.7. Monitor</h2>

Optionally reset your monitor to factory settings and reconfigure it in case anything was misconfigured initially. Overdrive/AMA reduces latency ([1](https://twitter.com/CaIypto/status/1464236780190851078)) however, it comes with the penalty of additional overshoot. Additionally, you can attempt to calibrate it. Optionally overclock your display with [Custom Resolution Utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) and test for [frame skipping](https://www.testufo.com/frameskipping). Aim for an `actual` integer refresh rate such as 60.00/240.00, not 59.94/239.76.

- See [Can You Calibrate a Monitor WITHOUT a Colorimeter? | techless](https://www.youtube.com/watch?v=avJTz1JhkR4)

<h1 id="stability-hardware-clocking-and-thermal-performance">9. Stability, Hardware Clocking and Thermal Performance</h1>

Ensure that all of your hardware is stable before configuring a new operating system as unstable hardware can lead to crashes, data corruption, worse performance or indirectly irreversible damage to hardware. The effectiveness of testing for instability varies between tools which is why it is important to use a range of them for a sufficient amount of time (a non-exhaustive list of recommended tools is listed below).

<h2 id="temporary-operating-system">9.1. Temporary Operating System</h2>

I would highly recommend configuring a temporary dual-boot with a fresh installation of Windows or a bootable Windows USB ([Windows To Go](https://www.youtube.com/watch?v=w34x1kBZN6c)) to avoid corrupting your main operating system while stress-testing and overclocking. In terms of memory stress-testing, this also allows the stress-test to use more RAM as it isn't being hogged by potential bloatware on your current installation. Safe mode can also serve as a minimal testing environment but certain software may not work.

<h2 id="general-information">9.2. General Information</h2>

- Verify and validate changes within software to avoid unexpected results and behavior (e.g. frequency, voltages, timings)

- Save a BIOS profile before each change when overclocking such as changing CPU/RAM frequency and RAM timings so that you don't lose progress if you need to clear CMOS. Refer to section [BIOS Profiles and Backups](#bios-profiles-and-backups) regarding restoring settings properly

- When overclocking, you may be required to raise various power limits if the default limits are exceeded

- Use [HWiNFO](https://www.hwinfo.com) to monitor system sensors. A higher polling interval can help to identify sudden spikes but not transients on a microsecond scale as an example. Avoid running while benchmarking as it has the potential to reduce the reliability of results

- A single error or crash is one too many. Monitor WHEAs with [HWiNFO](https://www.hwinfo.com)'s error count or configure an Event Viewer filter

- Monitor voltages where applicable due to potential overvolting

- There are countless factors that contribute to stability such as temperature, power delivery, quality of hardware in general, silicon lottery and more

<h2 id="error-correction">9.3. Error Correction</h2>

Overclocking does not necessarily mean that the system will perform better due to factors such as error correction where applicable. You should verify whether whatever you are changing scales positively by adopting a systematic benchmarking methodology.

<h2 id="thermal-management">9.4. Thermal Management</h2>

Avoid thermal throttling at all costs. As a reminder, ambient temperature will generally increase during the summer. Deliberately underclock if your cooler is inadequate. A thermally stable component with an overall lower frequency is preferable compared to thermal throttling at a higher frequency/voltage. To apply additional thermal stress when tuning any component (e.g. CPU, RAM, GPU), consider turning off case, RAM fans or reducing RPM along with generating extra heat (e.g. GPU load, room heaters) while stress-testing.

- See [RAM Overclock Stability and Heat Management | buildzoid](https://www.youtube.com/watch?v=iCD0ih4qzHw)

<h2 id="load-line-calibration">9.5. Load-line Calibration</h2>

This is not a recommendation of what LLC mode to use and is instead, here for informative purposes.

- See [VRM Load-Line Visualized | ElmorLabs](https://elmorlabs.com/2019-09-05/vrm-load-line-visualized)
- See [Vdroop setting and it’s impact on CPU operation | xDevs](https://xdevs.com/guide/e399ocg/#vdroop)
- See [Why Vdroop is good for overclocking and taking a look at Gigabyte's Override Vcore mode | buildzoid](https://www.youtube.com/watch?v=zqvNkh4TVw8)

<h2 id="gpu">9.6. GPU</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

When overclocking the GPU, you may be required to flash a BIOS with a higher power limit or raise them.

- On NVIDIA systems, ensure to disable ``CUDA - Force P2 State`` with [NVIDIA Profile Inspector](https://github.com/Orbmu2k/nvidiaProfileInspector) to prevent memory downclocking while stress-testing
- See [A Slightly Better Way To Overclock and Tweak Your Nvidia GPU | Cancerogeno](https://docs.google.com/document/d/14ma-_Os3rNzio85yBemD-YSpF_1z75mZJz1UdzmW8GE/edit)
- See [LunarPSD/NvidiaOverclocking](https://github.com/LunarPSD/NvidiaOverclocking/blob/main/Nvidia%20Overclocking.md)

<h2 id="ramcpu">9.7. RAM/CPU</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

- Ensure that your CPU is able to boost correctly before starting in case you have disabled options such as SpeedStep and Speed Shift which can prevent the processor from exceeding its base frequency

- Configure RAM frequency and timings manually for a significant performance improvement ([1](https://kingfaris.co.uk/blog/intel-ram-oc-impact)). XMP does not tune many timings nor does it guarantee stability

  - See [Eden’s DDR4 guide](https://web.archive.org/web/20231211232729/https://cdn.discordapp.com/attachments/328891236918493184/1172922515962724444/DDR4_Guide_V1.2.1.pdf)
  - See [KoTbelowall/INTEL-DDR4-RAM-OC-GUIDE-by-KoT](https://github.com/KoTbelowall/INTEL-DDR4-RAM-OC-GUIDE-by-KoT)
  - See [integralfx/MemTestHelper](https://github.com/integralfx/MemTestHelper/blob/oc-guide/DDR4%20OC%20Guide.md)

- Configure static all-core frequencies and voltages for the CPU. Variations in hardware clocks can introduce jitter due to the process of frequency transitions. [Precision Boost Overdrive](https://www.amd.com/en/support/kb/faq/cpu-pb2) for Ryzen CPUs is an alternative option to a static frequency and voltages and is often recommended

- The previous two bullet points affect each other in terms of stability which means that your RAM overclock may become unstable after tuning the CPU, so run RAM stress-tests again and adjust your CPU settings if required

<h2 id="stress-testing-tools">9.8. Stress-Testing Tools</h2>

- [StresKit]((https://github.com/valleyofdoom/StresKit)) (bootable)

- Linpack

  - [StresKit](https://github.com/valleyofdoom/StresKit)'s Linpack
  - [Linpack-Extended](https://github.com/BoringBoredom/Linpack-Extended)
  - [Linpack Xtreme Bootable](https://www.techpowerup.com/download/linpack-xtreme)
  - Use a range of memory sizes
  - Residuals should match otherwise, it may be a sign of instability
  - GFLOP variation should be minimal

- [Prime95](https://www.mersenne.org/download)

- [FIRESTARTER](https://github.com/tud-zih-energy/FIRESTARTER)

- [y-cruncher](http://www.numberworld.org/y-cruncher)

- [Memory Testing Software](https://github.com/integralfx/MemTestHelper/blob/oc-guide/DDR4%20OC%20Guide.md#memory-testing-software)

  - [HCI](https://hcidesign.com/memtest)
  - [MemTest86](https://www.memtest86.com) (bootable)
  - [MemTest86+](https://memtest.org) (bootable)

- [UNIGINE Superposition](https://benchmark.unigine.com/superposition)

- [OCCT](https://www.ocbase.com)

- [memtest_vulkan](https://github.com/GpuZelenograd/memtest_vulkan)

<h1 id="install-windows">10. Install Windows</h1>

<h2 id="storage-partitions">10.1. Storage Partitions</h2>

Set up a [multi-boot](https://en.wikipedia.org/wiki/Multi-booting) system to maintain separate environments for work/bloatware and gaming, ensuring the latter one remains free of bloatware. This allows you to keep the gaming partition clean and free of unnecessary software, as discussed in earlier sections. By doing so, you avoid installing bloatware on the same partition where you use real-time applications without sacrificing usability. To achieve this, shrink a volume in Disk Management ([instructions](https://docs.microsoft.com/en-us/windows-server/storage/disk-management/shrink-a-basic-volume)) to create unallocated space for installing the new operating system.

<h2 id="what-version-of-windows-should-you-use">10.2. What Version of Windows Should You Use?</h2>

This section contains important points to consider that have been collected over the years in regard to Windows versions, compatibility and exclusive features.

- Earlier versions of Windows lack anticheat support (due to lack of security updates from end-of-life OSes), driver support (commonly GPU, NIC) and application support in general, so some users are forced to use newer builds. See the table below of the minimum version required to install drivers for given GPUs. Subject to change

    |GPU|Minimum Windows Version|
    |---|---|
    |NVIDIA 10 series and lower|Supported by almost all Windows versions|
    |NVIDIA 16, 20 series|Win7, Win8, Win10 1709+|
    |NVIDIA 30 series|Win7, Win10 1803+|
    |NVIDIA 40 series|Win10 1803+|
    |AMD|Refer to driver support page|

- Windows Server lacks support for a lot of consumer NICs. Workaround tends such as [this](https://github.com/loopback-kr/Intel-I219-V-for-Windows-Server) tend to interfere with anticheats due to invalid signing certificates

- NVIDIA DCH drivers are supported on Windows 10 1803+ ([1](https://nvidia.custhelp.com/app/answers/detail/a_id/4777/~/nvidia-dch%2Fstandard-display-drivers-for-windows-10-faq))

- During media playback exclusively on Windows 10 1709, the [Multimedia Class Scheduler Service](https://learn.microsoft.com/en-us/windows/win32/procthread/multimedia-class-scheduler-service) raises the timer resolution to 0.5ms which limits control regarding the requested resolution

- Windows 10 1809+ is required for Ray Tracing on NVIDIA GPUs

- Microsoft implemented a fixed 10MHz QueryPerformanceFrequency on Windows 10 1809+

- Windows 10 1903+ has an updated scheduler for multi CCX Ryzen CPUs ([1](https://i.redd.it/y8nxtm08um331.png))

- DirectStorage requires Windows 10 1909+ but according to an article, games running on Windows 11 benefit further from new storage stack optimizations ([1](https://devblogs.microsoft.com/directx/directstorage-developer-preview-now-available))

- Windows 10 2004+ is required for [Hardware Accelerated GPU Scheduling](https://devblogs.microsoft.com/directx/hardware-accelerated-gpu-scheduling) which is necessary for DLSS Frame Generation ([1](https://developer.nvidia.com/rtx/streamline/get-started))

- Processes raising the timer resolution on Windows 10 2004+ no longer affect the global timer resolution ([1](https://learn.microsoft.com/en-us/windows/win32/api/timeapi/nf-timeapi-timebeginperiod), [2](https://randomascii.wordpress.com/2020/10/04/windows-timer-resolution-the-great-rule-change)) meaning that it is set on a per-process basis in which, processes that do not explicitly raise the resolution are not guaranteed a higher resolution and are serviced less often. This was further developed on Windows 11 as a higher resolution is not guaranteed to the calling process if its window is minimized or visibly occluded ([1](https://learn.microsoft.com/en-us/windows/win32/api/timeapi/nf-timeapi-timebeginperiod)). Microsoft added the ability to restore the global behavior on Windows Server 2022+ and Windows 11+ with a registry entry ([1](https://randomascii.wordpress.com/2020/10/04/windows-timer-resolution-the-great-rule-change)) meaning that the implementation can not be restored on Windows 10 versions 2004 - 22H2

- Windows 11+ has an updated scheduler for Intel 12th Gen CPUs and above ([1](https://www.anandtech.com/show/16959/intel-innovation-alder-lake-november-4th/3)) but the behavior can be replicated manually with affinity policies on any Windows version as explained in later sections

- Windows 11+ limits the window message rate of background processes ([1](https://blogs.windows.com/windowsdeveloper/2023/05/26/delivering-delightful-performance-for-more-than-one-billion-users-worldwide))

- Windows 11 is a minimum requirement for [Cross Adapter Scan-Out](https://videocardz.com/newz/microsoft-cross-adapter-scan-out-caso-delivers-16-fps-increse-on-laptops-without-dgpu-igpu-mux-switch) ([1](https://devblogs.microsoft.com/directx/optimizing-hybrid-laptop-performance-with-cross-adapter-scan-out-caso))

- AllowTelemetry can be set to 0 on Windows Server editions ([1](https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.DataCollection::AllowTelemetry))

<h2 id="downloading-and-preparing-a-stock-windows-iso">10.3. Downloading and Preparing a Stock Windows ISO</h2>

In order to install Windows, an installation media must be created using an ISO file. Upon downloading ISOs, ensure to cross-check the hashes for the file with official sources to verify that it is genuine and not corrupted. Use the command ``certutil -hashfile <file>`` in CMD to obtain the hashes of the file.

Ensure to download an ISO that contains an edition with group policy support as several policies are configured in later steps. Sometimes, you can get ISOs with specific editions missing so be careful. Below is a list of recommended editions.

- Client editions: Professional
- Server editions: Standard (Desktop Experience)

<h2 id="iso-sources">10.4. ISO Sources</h2>

- [os.click](https://os.click)
- [New Download Links](https://docs.google.com/spreadsheets/d/1zTF5uRJKfZ3ziLxAZHh47kF85ja34_OFB5C5bVSPumk)
- [Adguard File List](https://files.rg-adguard.net)
- [Microsoft Software Download Listing](https://massgrave.dev/msdl)
- [Fido](https://github.com/pbatard/Fido)
- [UUP dump](https://uupdump.net)

<h2 id="iso-preparation">10.5. ISO Preparation</h2>

<details>
<summary>Windows 7</summary>

If you are configuring Windows 7, I recommend using the ``en_windows_7_professional_with_sp1_x64_dvd_u_676939.iso`` ISO ([Adguard hashes](https://files.rg-adguard.net/file/11ad6502-c2aa-261c-8c3f-c81477b21dd2?lang=en-us)). Aditionally, you won't be able to boot into the ISO on modern hardware without integrating necessary drivers and updates which can be accomplished using tools such as [NTLite](https://www.ntlite.com) ([instructions](https://winraid.level1techs.com/t/guide-integration-of-drivers-into-a-win7-11-image/30793)) or DISM in CLI ([instructions](/docs/image-customization.md)), however NTLite is more user-friendly. Typically, only [NVMe](https://winraid.level1techs.com/t/recommended-ahci-raid-and-nvme-drivers/28310) and [USB](https://winraid.level1techs.com/t/usb-3-0-3-1-drivers-original-and-modded/30871) drivers are required to be integrated into the ISO to even be able to boot into it. Ensure to integrate the drivers in Windows Setup as well otherwise you may have storage detection issues and unusable USB input, unless you plan on installing the ISO with DISM as described in section [Booting Into the ISO](#booting-into-the-iso) because it completely bypasses traditional Windows Setup and the ``boot.wim``. To find drivers that are compatible with your device, search for ones that support your device's HWID ([example](/assets/images/device-hwid-example.png)). If you are unable to find a USB driver for your HWID, try to integrate the [generic USB driver](https://forums.mydigitallife.net/threads/usb-3-xhci-driver-stack-for-windows-7.81934) and the ``KB2864202`` update. Below is a table of updates that I recommend integrating into the ISO.

|Knowledge Base (KB) ID|Notes|
|---|---|
|KB4490628|Servicing Stack Update|
|KB4474419|SHA-2 Code Signing Update|
|KB2670838|Platform Update and DirectX 11.1|
|KB2990941|NVMe Support (<https://files.soupcan.tech/KB2990941-NVMe-Hotfix/Windows6.1-KB2990941-x64.msu>)|
|KB3087873|NVMe Support and Language Pack Hotfix|
|KB2864202|KMDF Update (required for USB 3/XHCI driver stack)|
|KB4534314|Easy anticheat Support|
|KB3191566|WMF 5.1 (<https://www.microsoft.com/en-us/download/details.aspx?id=54616>)|

If you are having trouble with Windows Setup when installing with a USB storage device despite integrating drivers and updates into the ``boot.wim``, you can use modern Windows Setup to install your Windows 7 ISO by placing the Windows 7 ``intall.wim`` in the ``sources`` folder of a Windows 10 USB installation media's ``sources`` folder. Ensure that the language of the ISOs match. This method of installing Windows 7 has alleviated issues for other individuals as modern Windows Setup is equipped with the required components to run on modern hardware and offers greater compatibility.
</details>

<details>
<summary>Windows 8.1</summary>

If you are configuring Windows 8.1, I recommend using the ``en_windows_8_1_x64_dvd_2707217.iso`` ISO ([Adguard hashes](https://files.rg-adguard.net/file/406e60db-4275-7bf8-616f-56e88d9e0a4a?lang=en-us)). Additionally, the table below contains a list of updates that I recommend integrating into the ISO which can be accomplished using tools such as [NTLite](https://www.ntlite.com) ([instructions](https://winraid.level1techs.com/t/guide-integration-of-drivers-into-a-win7-11-image/30793)) .

|Knowledge Base (KB) ID|Notes|
|---|---|
|KB2919442|Servicing Stack Update|
|KB2999226|Universal C Runtime|
|KB2919355|Cumulative Update|
|KB3191566|WMF 5.1 (<https://www.microsoft.com/en-us/download/details.aspx?id=54616>)|

</details>

<details>
<summary>Windows 10+</summary>

No additional steps are required for Windows 10+ versions. The latest updates can be inegrated but this is not required if you plan on keeping Windows Update enabled once booted in the ISO. Additionally, ISOs build using UUP dump ship with the latest updates assuming that you build the latest version. This can be achieved using [NTLite](https://www.ntlite.com) ([instructions](https://winraid.level1techs.com/t/guide-integration-of-drivers-into-a-win7-11-image/30793)) or DISM in CLI ([instructions](/docs/image-customization.md)), however NTLite is more user-friendly.
</details>

> [!IMPORTANT]
> The presence of OEMs keys can force the installation of specific editions of Windows editions (e.g. Home) which is explained in section [Downloading and Preparing a Stock Windows ISO](#downloading-and-preparing-a-stock-windows-iso). To circumvent this, you can either customize ``EI.cfg`` and ``PID.txt`` ([instructions](https://www.youtube.com/watch?v=R3yM3AV6q-8)) or remove every edition apart from the edition you would like to install using [NTLite](https://www.ntlite.com) or DISM in CLI ([instructions](/docs/image-customization.md)), however NTLite is more user-friendly.

<h2 id="fetching-required-files">10.6. Fetching Required Files</h2>

There are primarily two prerequisites before installing Windows. These can be done later if you are willing to fetch them from another system but I would recommend getting them now. Store these somewhere that you can access offline after installing Windows such as a USB storage device as the installation process consists of not being connected to a network in the initial steps.

1. Download your NIC driver as it may not be packaged with Windows and must be installed in order to connect to a network
2. The ``bin`` folder from this repository which can be downloaded [here](https://github.com/valleyofdoom/PC-Tuning/archive/refs/heads/main.zip)

<h2 id="booting-into-the-iso">10.7. Booting Into the ISO</h2>

This section covers booting into the ISO retrieved and prepared in the previous section. For the next steps, you are required to disconnect the Ethernet cable and not be connected to the internet during the installation process. This will allow us to bypass the forced Microsoft login during OOBE, allowing us to use Windows with a local account along with preventing installation of unwanted updates and drivers. There are two options when it comes to installing Windows, installing using USB storage or using DISM (without USB storage). Either option can be used. The latter option requires dual-booting.

<details>
<summary>Option 1 -  Install using USB storage</summary>

- Download [Ventoy](https://github.com/ventoy/Ventoy/releases) and launch ``Ventoy2Disk.exe``. Navigate to the option menu and select the correct partition style and disable Secure Boot support. The current partition style can be determined by typing ``msinfo32`` in ``Win+R``. Finally, select your USB storage and click install. If you want to remove your current operating system and wipe the entire drive, then you will have to install using USB storage

- Move your Windows ISO into the USB storage in File Explorer

- If Secure Boot is enabled, temporarily disable it for the installation process. Boot into Ventoy on your USB in BIOS and select your Windows ISO. Continue with setup as per usual. Once setup has finished, Secure Boot can be re-enabled if you had temporarily disabled it

- When installing Windows 8 with a USB, you may be required to enter a key. Use the generic key ``GCRJD-8NW9H-F2CDX-CCM8D-9D6T9`` to bypass this step. This does not activate Windows

- When installing Win11 with a USB, you may encounter system requirement issues. To bypass the checks, press ``Shift+F10`` to open CMD then type ``regedit`` and add the relevant registry keys listed below

    ```
    [HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig]
    "BypassTPMCheck"=dword:00000001
    "BypassRAMCheck"=dword:00000001
    "BypassSecureBootCheck"=dword:00000001
    ```

</details>

<details>
<summary>Option 2 -  Install using DISM Apply-Image (without USB storage)</summary>

- As this method requires specifying an existing partition to apply the ISO to, create a new partition by [shrinking a volume](https://docs.microsoft.com/en-us/windows-server/storage/disk-management/shrink-a-basic-volume) if you haven't already, then assign the newly created unallocated space a drive letter

- Extract the ISO if required then run the command below to apply the image to a given partition. Replace ``<path\to\wim>`` with the path to the ``install.wim`` or ``install.esd`` in each command

  - Get all available editions and their corresponding indexes

      ```bat
      DISM /Get-WimInfo /WimFile:<path\to\wim>
      ```

  - Apply the image by replacing ``<index>`` with the index of the desired edition and ``<drive letter>`` with the drive letter you assigned in the previous step for the image to be mounted on (e.g. index ``1`` and drive letter ``D:``)

      ```bat
      DISM /Apply-Image /ImageFile:<path\to\wim> /Index:<index> /ApplyDir:<drive letter>
      ```

- Create the boot entry with the command below. Replace ``<windir>`` with the path to the mounted ``Windows`` directory (e.g. ``D:\Windows``)

    ```bat
    bcdboot <windir>
    ```

- The installation process will begin after a system restart

</details>

<h1 id="configure-windows">11. Configure Windows</h1>

<h2 id="oobe-setup">11.1 OOBE Setup</h2>

- Windows Server may force you to enter a password which can be optionally be removed in later steps

- If you are configuring Windows 11, press ``Shift+F10`` to open CMD and execute ``oobe\BypassNRO.cmd``. This will allow us to continue without an internet connection by unlocking the ``continue with limited setup`` option as demonstrated in the video examples below. With that said, this also removes the requirement to sign in with a Microsoft account which I highly advise against for privacy reasons generally speaking

- See [assets/videos/oobe-windows7-example.mp4](/assets/videos/oobe-windows7-example.mp4)
- See [assets/videos/oobe-windows8-example.mp4](/assets/videos/oobe-windows8-example.mp4)
- See [assets/videos/oobe-windows10+-example.mp4](/assets/videos/oobe-windows10+-example.mp4)

<h2 id="unrestricted-powershell-execution-policy">11.2. Unrestricted PowerShell Execution Policy</h2>

> [!WARNING]
> 🔒 Setting the PowerShell Execution Policy to Unrestricted may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting. Alternatively, ``-ExecutionPolicy Bypass`` can be used when starting a PowerShell instance instead of configuring it globally.

This is required to execute the scripts within the repository. Open PowerShell as administrator and enter the command below.

```powershell
Set-ExecutionPolicy Unrestricted
```

<h2 id="importing-bin-folder">11.3. Importing bin Folder</h2>

Move the ``bin`` folder that you downloaded prior to installing Windows to the ``C:`` drive as outlined in section [Fetching Required Files](#fetching-required-files). If you haven't downloaded it yet, you will need to fetch it from another system as you don't have network access at this stage. The complete path should be ``C:\bin``.

<h2 id="process-mitigations-windows-10-1709">11.4. Process Mitigations (Windows 10 1709+)</h2>

> [!WARNING]
> 🔒 Disabling process mitigations may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

There are several OS-level mitigations ([1](https://learn.microsoft.com/en-us/powershell/module/processmitigations/set-processmitigation?view=windowsserver2019-ps#-disable)) that are enabled by default and may impact performance. If desired, these can be disabled in Windows Defender's "Exploit Protection" page. It should be apparent that disabling mitigations reduces security. This step is carried out now as if you choose to disable Windows Defender in the next steps, the interface will no longer be accessible however they can be toggled using the [Get-ProcessMitigation](https://learn.microsoft.com/en-us/powershell/module/processmitigations/get-processmitigation?view=windowsserver2022-ps) and [Set-ProcessMitigation](https://learn.microsoft.com/en-us/powershell/module/processmitigations/set-processmitigation?view=windowsserver2019-ps) commands in PowerShell. Some programs may require mitigations to be enabled and will break if they are disabled so proceed with caution.

<h2 id="merging-registry-options">11.5. Merging Registry Options</h2>

> [!WARNING]
> 🔒 Some changes outlined in the table below may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

The registry settings are merged with the ``apply-registry.ps1`` script. As for which options get applied, there are outlined in the table below which this can be customized by editing ``C:\bin\registry-options.json`` in a text editor and setting properties to either ``true`` or ``false``. You can backup the config file so that you don't need to modify it each time you reinstall Windows.

<h3 id="registry-options-documentation">11.5.1. Registry Options Documentation</h3>

> [!IMPORTANT]
> As of now, the script does not revert options if re-run. For example, if the script was run with an option set to ``true``, then running the script with a given option set to ``false`` will not revert the changed made as the script is unaware of the previous state of the registry keys associated with the option. This functionality may be implemented in the future but for now, use the ``-get_option_keys <option>`` argument with the script to get all relevant keys for a given option so that you can revert them manually.

|Option|Incentive|Notes|Default Value|
|---|---|---|---|
|``disable windows update``|1. Reducing CPU overhead<br><br>2. Gaining finer control over the feature in question|🔒 A value of ``true`` may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting<br><br>Disabling Windows Update is in Microsoft's recommendations for configuring devices for real-time performance ([1](https://learn.microsoft.com/en-us/windows/iot/iot-enterprise/soft-real-time/soft-real-time-device)). Alternatively automatic updates can be disabled instead of disabling Windows Update completely which achieves the same effect in terms of reducing CPU overhead but still being able to update Windows by configuring ``disable windows update`` to ``false`` and ``disable automatic windows updates`` to ``true``. The Windows Update processes are known to use a lot of CPU and memory resources. Disabling Windows Update breaks the Microsoft Store however you can download and install Appx packages directly ([instructions](https://superuser.com/questions/1721755/is-there-a-way-to-install-microsoft-store-exclusive-apps-without-store))|``false``|
|``disable automatic windows updates``|1. Reducing CPU overhead<br><br>2. Gaining finer control over the feature in question|🔒 A value of ``true`` may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting<br><br>Prevents automatic download and installation of Windows updates rather than disabling Windows Update completely and instead, check for updates manually from time to time. Updates can occur at inconvenient times which leads to excessive CPU and memory usage at random intervals along with disrupting shutdowns in certain cases. This option is overridden if ``disable windows update`` is set to ``true``. <br><br>This option does not affect upgrades which can be controlled using group policies ([instructions](https://www.tenforums.com/tutorials/159624-how-specify-target-feature-update-version-windows-10-a.html)). However, you are limited to preventing upgrades until the specified version reaches end-of-life|``true``|
|``disable driver installation via windows update``|1. Reducing CPU overhead<br><br>2. Gaining finer control over the feature in question|Prevents outdated, vulnerable and potentially poorly performing drivers from being installed via Windows Update. It is recommended to manually install only the bare minimum version of the ones that your system requires (as the full installer often installs other bloatware that persistently runs in the background) along with the latest version directly from the manufacture's website as outlined in section [Installing Drivers](#installing-drivers). This option is overridden if ``disable windows update`` is set to ``true``|``true``|
|``disable automatic store app updates``|1. Reducing CPU overhead<br><br>2. Gaining finer control over the feature in question|🔒 A value of ``true`` may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting<br><br>Prevents automatic download and installation of store application updates compared to disabling app updates completely which is not desirable in terms of reducing CPU overhead. Instead, check for application updates manually from time to time|``true``|
|``disable windows defender``|1. Reducing CPU overhead<br><br>2. Prevents issues with the CPU entering C-State 0 ([1](https://www.techpowerup.com/295877/windows-defender-can-significantly-impact-intel-cpu-performance-we-have-the-fix))|🔒 A value of ``true`` may negatively impact security. Users should assess the security risk involved with modifying the mentioned setting<br><br>This option completely disables Windows Defender. Instead, run system scans frequently, use a hardened browser with [uBlock Origin](https://ublockorigin.com), keep UAC enabled and favor free, open source and reputable software. Stay away from proprietary software where you can and ensure to scan files and executables with [VirusTotal](https://www.virustotal.com/gui/home/upload) before opening them|``true``|
|``disable gamebarpresencewriter``|1. Reducing CPU overhead|Process runs constantly in the background and is not required for Game Mode or Game Bar to function from my testing|``true``|
|``disable background apps``|1. Reducing CPU overhead|Prevents apps from running in the background. Background applications are disabled via policies with this option as the option is not available in the interface on Windows 11|``true``|
|``disable transparency effects``|1. Reducing CPU overhead  ([1](/assets/images/transparency-effects-benchmark.png))|Disables transparency effects|``true``|
|``disable notifications network usage``|1. Mitigating telemetry and phoning home ([1](https://learn.microsoft.com/en-gb/windows/privacy/manage-connections-from-windows-operating-system-components-to-microsoft-services#10-live-tiles))|N/A|``true``|
|``disable windows marking file attachments with information about their zone of origin``|1. Reducing or disabling intrusive features|🔒 A value of ``true`` may negatively impact security. Users should assess the security risk involved with modifying the mentioned setting<br><br>Prevents [this](https://www.tenforums.com/tutorials/85418-how-disable-downloaded-files-being-blocked-windows.html) intrusive security warning as downloaded files are constantly required to be unblocked however this may negatively impact security as the user will not be notified of blocked files via a security warning prompt ([1](https://www.tenforums.com/tutorials/85418-how-disable-downloaded-files-being-blocked-windows.html))|``true``|
|``disable malicious software removal tool updates``|1. Gaining finer control over the feature in question|🔒 A value of ``true`` may negatively impact security. Users should assess the security risk involved with modifying the mentioned setting<br><br>Prevent Windows offering Malicious Software Removal Tool through Windows Update|``true``|
|``disable sticky keys``|1. Reducing or disabling intrusive features|Disables the *Do you want to turn on Sticky Keys?* promt when the hotkey is pressed a certain number of times. This is severely intrusive in applications that utilize the ``Shift`` key for controls such as games|``true``|
|``disable pointer acceleration``|1. Reducing or disabling intrusive features|Ensures one-to-one mouse response for games that do not subscribe to raw input events and on Desktop|``true``|
|``disable fast startup``|1. Reducing or disabling intrusive features|Interferes with shutting down in the sense that the system does not enter S5 which can lead to unexpected issues ([explanation](https://www.youtube.com/watch?v=OBGxt8zhbRk)). See section [Fast Startup, Standby and Hibernate](#fast-startup-standby-and-hibernate) for related information. It is possible to shut down  properly without disabling Fast Startup by holding ``Shift`` while clicking ``Shut down`` in the start menu. However, the downside to this is that you may forget to hold the ``Shift`` key|``true``|
|``disable customer experience improvement program``|1. Mitigating telemetry and phoning home ([1](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/jj618322(v=ws.11)))|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable windows error reporting``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable clipboard history``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable activity feed``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable advertising id``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable autoplay``|1. Mitigate security risk|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable cloud content``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable account-based explorer features``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable mdm enrollment``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable microsoft store push to install feature``|1. Mitigate security risk|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``mitigate web-based search info``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable sending inking and typing data to microsoft``|1. Mitigating telemetry and phoning home|Recommended by [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies)|``true``|
|``disable automatic maintenance``|1. Gaining finer control over the feature in question|N/A|``true``|
|``disable program compatibility assistant``|1. Gaining finer control over the feature in question|Prevents Windows applying changes anonymously after running troubleshooters|``true``|
|``disable remote assistance``|1. Mitigate security risk|N/A|``true``|
|``disable sign-in and lock last interactive user after a restart``|1. Mitigate security risk ([1](https://www.stigviewer.com/stig/windows_server_2012_2012_r2_member_server/2014-06-30/finding/V-43245))|N/A|``true``|
|``show file extensions``|1. Mitigate security risk ([1](https://www.youtube.com/watch?v=nYdS3FIu3rI))|N/A |``true``|
|``disable widgets``|1. Mitigate security risk ([1](https://www.youtube.com/watch?v=m9d-fXl3Z8k))|N/A|``true``|
|``disable telemetry``|1. Mitigating telemetry and phoning home|N/A|``true``|
|``disable retrieval of online tips and help in the immersive control panel``|1. Mitigating telemetry and phoning home|N/A|``true``|
|``disable typing insights``|1. Mitigating telemetry and phoning home|N/A|``true``|
|``disable suggestions in the search box and in search home``|1. Mitigating telemetry and phoning home<br><br>2. Reducing or disabling intrusive features|N/A|``true``|
|``disable computer is out of support message``|1. Reducing or disabling intrusive features|Disables [this](https://support.microsoft.com/en-us/topic/you-received-a-notification-your-windows-7-pc-is-out-of-support-3278599f-9613-5cc1-e0ee-4f81f623adcf) intrusive message. Not relevant to users with a modern Windows version|``true``|
|``disable fault tolerant heap``|1. Gaining finer control over the feature in question|Prevents Windows autonomously applying mitigations to prevent future crashes on a per-application basis ([1](https://learn.microsoft.com/en-us/windows/win32/win7appqual/fault-tolerant-heap)) which can lead to issues ([1](https://www.mak.com/mak-one/support/help/knowledge/performance-issues-caused-by-the-fault-tolerant-heap-windows))|``true``|

<h3 id="applying-options">11.5.2. Applying Options</h3>

- Open PowerShell as administrator and enter the command below. If the command fails, then try to disable tamper protection (Windows 10 1909+) and real-time protection in Windows Defender . If that doesn't work, reboot then re-execute the command again. If none of the previous workarounds worked, then try run the command in safe-mode. If you prefer not to run any scripts, the option of manually creating the registry file with the keys you need are explained in [/docs/registry-opts.md](/docs/registry-opts.md). This document contains all of the keys that would be merged when using the script

    ```powershell
    C:\bin\apply-registry.ps1
    ```

- Ensure that the script prints a "successfully applied" message to the console, if it does not then the registry keys were not successfully merged

- After and only after a restart, you can establish an internet connection as the Windows update policies will take effect, which is the primary reason for not being connected to the internet up until this point

> [!NOTE]
> To the maintainers and contributors, the features and options should be tested as listed in the table above. It is inevitable that more steps are required to achieve the same goal with operating system updates and upgrades over time (e.g. manual maintenance of a list of services relating to disabling Windows Defender).

<h2 id="installing-drivers">11.6. Installing Drivers</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

- I would advise against installing drivers via Windows Update as they can be outdated compared to the ones provided by the vendor. Driver updates via Windows Update should be blocked if ``disable driver installation via windows update`` was disabled in section [Merging Registry Options](#merging-registry-options)

- See [Chipset Device "Drivers" (= INF files) | Fernando](https://winraid.level1techs.com/t/intel-chipset-device-drivers-inf-files/30920)

- GPU drivers will be installed in section [Graphics Driver](#graphics-driver) so do not install them at this stage

- You can find drivers by searching for drivers that are compatible with your device's HWID. See [media/device-hwid-example.png](/assets/images/find-driver-key-example.png) in regard to finding your HWID in Device Manager for a given device

- Try to obtain the driver in its INF form so that it can be installed in Device Manager as executable installers usually install other bloatware along with the driver itself. Sometimes you can extract the installer's executable with 7-Zip

- It is recommended to update and install the following:

  - Network Interface Controller. If you do not have internet access at this stage, you will need to download your NIC driver from another device or dual-boot as they may not be packaged at all with Windows

  - [USB](https://winraid.level1techs.com/t/usb-3-0-3-1-drivers-original-and-modded/30871) and [NVMe](https://winraid.level1techs.com/t/recommended-ahci-raid-and-nvme-drivers/28310) (if you are configuring Windows 7, both may have already been integrated in section [Downloading and Preparing a Stock Windows ISO](#downloading-and-preparing-a-stock-windows-iso))

  - [SATA](https://winraid.level1techs.com/t/recommended-ahci-raid-and-nvme-drivers/28310) (required on Windows 7 as the stock driver does not support Message Signaled Interrupts)

- Other required drivers can be installed with [Snappy Driver Installer Origin](https://www.snappy-driver-installer.org)

<h2 id="windows-server-specific-options-windows-server">11.7. Windows Server Specific Options (Windows Server)</h2>

- To enable Wi-Fi, navigate to ``Manage -> Add Roles and Features`` in the Server Manager dashboard and enable ``Wireless LAN Service``

- In Server Manager, navigate to ``Manage -> Server Manager Properties`` and enable the option to prevent Server Manager from starting automatically

- Set the ``Windows Audio`` and ``Windows Audio Endpoint Builder`` services startup type to automatic by typing ``services.msc`` in ``Win+R``

- Navigate to ``Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`` by typing ``gpedit.msc`` in ``Win+R`` and disable ``Password must meet complexity requirements``

  - Open CMD and type ``gpupdate /force`` to apply the changes immediately

- Navigate to ``Computer Configuration -> Administrative Templates -> System`` by typing ``gpedit.msc`` in ``Win+R`` and disable ``Display Shutdown Event Tracker`` to disable the shutdown prompt

- To remove the user password, enter your current password and leave the new/confirm password fields blank in ``User Accounts`` by typing ``control userpasswords`` in ``Win+R``

<h2 id="privacy-options-windows-8">11.8. Privacy Options (Windows 8+)</h2>

Disable all unnecessary permissions in the ``Privacy`` section by pressing ``Win+I``.

<h2 id="search-indexing">11.9. Search Indexing</h2>

Certain directories on the file system are indexed for search features in Windows which can be viewed by typing ``control srchadmin.dll`` in ``Win+R``. Indexing occurs periodically in the background and often results in notable CPU overhead which can be seen using Process Explorer as described in section [Process Explorer](#process-explorer). Therefore, it is preferable to prevent search indexing globally by disabling the ``Windows Search`` service however, search features may be limited. Open CMD as administrator and enter the command below.

  ```bat
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f
  ```

> [!IMPORTANT]
> To prevent unexpected breakage and problems due to service dependency errors, assess the other services that depend on the service you want to disable. This can be done by opening CMD as administrator then typing ``sc EnumDepend <service>`` which describes the services that rely on the service you want to disable. These services should be disabled to avoid dependency errors. If you can't disable them (e.g. because you need them), then you have no choice but to leave the service you wanted to disable initially enabled.

<h2 id="time-language-and-region">11.10. Time, Language and Region</h2>

- Configure settings by typing ``intl.cpl`` and ``timedate.cpl`` in ``Win+R``

- Windows 10+ Only

  - Configure settings in ``Time & Language`` by pressing ``Win+I``

    - If you intend to exclusively use one language and keyboard layout, ensure that is the case in actuality so that you don't need to toggle the language bar hotkeys which can become intrusive as the hotkey can be accidentally pressed

- Ensure that the system time is synced and is correct

<h2 id="web-browser">11.11. Web Browser</h2>

Configure a browser of your choice.

- See [privacytests.org](https://privacytests.org)

- See [Desktop Browsers | Privacy Guides](https://www.privacyguides.org/en/desktop-browsers)

<h2 id="scheduled-tasks">11.12. Scheduled Tasks</h2>

There are a handful of scheduled tasks that ship with Windows which can be assessed using [TaskSchedulerView](https://www.nirsoft.net/utils/task_scheduler_view.html). Assessing them can help in having finer control as to what runs on your system silently whether it be updates-related, telemetry-related, defender-related and more. Consider the ``Last Run``, ``Next Run`` and ``Triggers`` column to evaluate whether there is any point disabling the task in question.

<h2 id="activate-windows">11.13. Activate Windows</h2>

Use the commands below to activate Windows using your license key if you do not have one linked to your HWID. Ensure that the activation process was successful by verifying the activation status in computer properties. Open CMD as administrator and enter the commands below.

```bat
slmgr /ipk <license key>
```

```bat
slmgr /ato
```

<h2 id="declutter-interface">11.14. Declutter Interface</h2>

Disable features on the taskbar and unpin shortcuts and tiles from the taskbar and start menu. This is obviously personal preference.

<h2 id="visual-effects">11.15. Visual Effects</h2>

Visual effects options can be accessed by typing ``sysdm.cpl`` in ``Win+R``. This menu provides the ability to disable interface animations which contributes to perceived responsiveness when generally interacting with Windows. On Windows 7, desktop composition could natively be disabled here, but the option is no longer available in Windows 8+. The rest of the options are personal preference.

<h2 id="superfetch-and-prefetch">11.16. Superfetch and Prefetch</h2>

If a HDD isn't present in the system then Superfetch and Prefetch can be disabled with the command below in CMD. Disabling SysMain is in Microsoft's recommendations for configuring devices for real-time performance ([1](https://learn.microsoft.com/en-us/windows/iot/iot-enterprise/soft-real-time/soft-real-time-device)) and the ``C:\Windows\Prefetch`` folder should no longer be populated.

  ```bat
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
  ```

> [!IMPORTANT]
> To prevent unexpected breakage and problems due to service dependency errors, assess the other services that depend on the service you want to disable. This can be done by opening CMD as administrator then typing ``sc EnumDepend <service>`` which describes the services that rely on the service you want to disable. These services should be disabled to avoid dependency errors. If you can't disable them (e.g. because you need them), then you have no choice but to leave the service you wanted to disable initially enabled.

<h2 id="operating-system-and-partition-name">11.17. Operating System and Partition Name</h2>

Configure the operating system and drive's partition name. It is recommended to set it to something meaningful or unique such has ``W10 22H2 Work`` or ``W10 22H2 Gaming`` for clarity when dual-booting or when multiple drives are present. Open CMD as administrator and enter the commands below.

  ```bat
  bcdedit /set {current} description "OS_NAME"
  ```

  ```bat
  label C: "OS_NAME"
  ```

<h2 id="show-tray-icons">11.18. Show Tray Icons</h2>

I would recommend enabling the ``Always show all icons in the notification area`` for better process management. Hiding icons in the tray area can partially be considered a security risk since you won't be aware of potentially malicious or unwanted programs running silently.

<h2 id="hibernation">11.19. Hibernation</h2>

Windows has a toggle that disables Fast Startup, hibernation and removes ``C:\hiberfil.sys``.  It is recommended to shut down instead of saving software state to disk. Open CMD as administrator and enter the command below.

```bat
powercfg /h off
```

<h2 id="runtimes">11.20. Runtimes</h2>

These are runtimes are common dependencies including a magnitude of applications. Typically, application installers automatically install its dependencies but this can't be said for some standalone applications.

- [Visual C++ Redistributable](https://github.com/abbodi1406/vcredist)
- [.NET 3.5](https://woshub.com/how-to-install-net-framework-3-5-on-windows) (less common dependency, instructions include both offline and online installation methods)
- [.NET 4.8](https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48) (ships with Windows 10 1909+)
- [WebView](https://developer.microsoft.com/en-us/microsoft-edge/webview2)
- [DirectX](https://www.microsoft.com/en-gb/download/details.aspx?id=8109) (game launchers typically install this silently)

<h2 id="handling-bloatware">11.21. Handling Bloatware</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

I heavily discourage running debloating scripts or removing components other than actual bloatware such as Candy Crush or whatever may be packaged with Windows these days to avoid breaking your operating system. It can be argued that removing these applications have no performance benefit if they don't actively run in the background which can be assessed in Task Manager. To adopt the approach of only removing or disabling what actively runs in the background, setup Process Explorer as described in [Process Explorer](#process-explorer) and sort processes by either ``Context Switch Delta`` or ``Cycles Delta`` to assess what can be removed. The update speed can be changed in ``View -> Update Speed`` depending on your tolerance.

- [AppxPackagesManager](https://github.com/valleyofdoom/AppxPackagesManager) can be used to uninstall Appx packages which ship with Windows. I recommend keeping ``Microsoft.WindowsStore`` (Microsoft Store) at the very least so that you can download applications in the future. Appx packages can also be installed without the Microsoft Store ([instructions](https://superuser.com/questions/1721755/is-there-a-way-to-install-microsoft-store-exclusive-apps-without-store)). If for whatever reason you removed the Microsoft Store, it can be restored with ``wsreset -i``

- I highly recommend removing OneDrive for privacy reasons and if you must, use OneDrive within a browser. Removing OneDrive involves opening CMD as administrator and entering the command below

    ```bat
    for %a in ("SysWOW64" "System32") do (if exist "%windir%\%~a\OneDriveSetup.exe" ("%windir%\%~a\OneDriveSetup.exe" /uninstall)) && reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
    ```

- Disabling (not uninstalling) Chromium Microsoft Edge involves the steps below. The browser should be disabled instead of uninstalled to retain the WebView runtime

  - In the Microsoft Edge settings, disable any startup options such as the ones listed below. Doing this prevents an autorun entry being created any time ``msedge.exe`` is started despite removing it in the next step with Autoruns

    - ``Startup boost``
    - ``Continue running background extensions and apps when Microsoft Edge is closed``

  - Download [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns) and navigate to the ``Everything`` section then search for *"edge"*. Disable every item that appears in the filtered results

  - Updating the browser will revert some changes made in the previous step. You can ensure that it does not update if it is opened accidentally with the command below. If any errors occur, ensure that there aren't any hidden Microsoft Edge process running in Task Manager

      ```bat
      rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
      ```

  - Open CMD and enter the command below to remove all related shortcuts

      ```bat
      for /f "delims=" %a in ('where /r C:\ *edge.lnk*') do (del /f /q "%a")
      ```

- Windows 10+ Only:

  - In the start menu, *uninstall* any residual links for applications. Keep in mind that these applications aren't actually installed, they get installed only if the user clicks on them so do not accidentally click on them

  - Uninstall bloatware in the applications section in the immersive control panel by pressing ``Win+I`` (this can also be managed in [AppxPackagesManager](https://github.com/valleyofdoom/AppxPackagesManager))
  - In the ``Optional features`` section within the immersive control panel, you can uninstall everything that you don't need if desired

- If Windows Defender was disabled in section [Merging Registry Options](#merging-registry-options), ``smartscreen.exe`` ignores the registry key that controls whether it runs in the background persistently on later versions of Windows. For this reason, open CMD as TrustedInstaller with ``C:\bin\MinSudo.exe --TrustedInstaller --Privileged`` and enter the command below to prevent it running in the background

    ```bat
    taskkill /f /im smartscreen.exe > nul 2>&1 & ren C:\Windows\System32\smartscreen.exe smartscreen.exee
    ```

- You can use Task Manager to check for residual bloatware that is running in the background

<h2 id="optional-features">11.22. Optional Features</h2>

Optional features can be accessed by typing ``OptionalFeatures`` in ``Win+R``. Enable/disable features that you do/don't need. If Windows Update is disabled then you likely won't be able to install features and instead, must install an offline package using DISM. On Windows Server, this can be accessed via the Server Manager dashboard by navigating to ``Manage -> Remove Roles and Features``.

<h3 id="net-35">11.22.1. NET 3.5</h3>

Some applications still utilize the NET 3.5 runtime so I would recommend installing it just in case. As mentioned previously, you won't be able to install it in the Optional Features window if Windows Update is disabled but can instead, be installed using an offline package.

For using the offline package, download and extract a Windows ISO (e.g. ``C:\EXTRACTED_ISO``) and open CMD as administrator. Replace ``C:\EXTRACTED_ISO\sources\sxs`` with the correct path to the ``\sources\sxs`` folder in the ISO that you extracted and run the command.

```bat
DISM /Online /Enable-Feature /FeatureName:NetFx3 /LimitAccess /Source:"C:\EXTRACTED_ISO\sources\sxs"
```

<h2 id="7-zip">11.23. 7-Zip</h2>

Download and install [7-Zip](https://www.7-zip.org). Open ``C:\Program Files\7-Zip\7zFM.exe`` then navigate ``Tools -> Options`` and associate 7-Zip with all file extensions by clicking the ``+`` button. You may need to click it twice to override existing associated extensions.

<h2 id="graphics-driver">11.24. Graphics Driver</h2>

- See [docs/configure-nvidia.md](/docs/configure-nvidia.md)
- See [docs/configure-amd.md](/docs/configure-amd.md)

<h2 id="msi-afterburner">11.25. MSI Afterburner</h2>

If you use [MSI Afterburner](https://www.msi.com/Landing/afterburner/graphics-cards), download and install it now.

- I recommend configuring a static fan speed as using the fan curve feature requires the program to run continually however, it is up to you whether to use the curve or not

- To automatically load profile 1 (as an example) when Windows boots, the command below can be used with Task Scheduler ([instructions](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)). Ensure to wrap any paths with quotes if there are spaces in them. Ensure to verify whether everything is working correctly after a system restart. You need to enable the ``Run with highest privileges`` option if administrator privileges are required

    ```bat
    "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe" /Profile1 /Q
    ```

<h2 id="display-resolutions-and-scaling-modes">11.26. Display Resolutions and Scaling Modes</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

You may have optionally found a stable overclock for your display in earlier sections using [Custom Resolution Utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) which you can dial in now.

- Typically, you have the option of performing scaling on the GPU or display. Native resolution does not require scaling thus results in identity (no) scaling. Furthermore, identity scaling renders most of the scaling options in the GPU control panel obsolete. If you are using a non-native resolution, there is an argument for favoring display scaling due to less GPU processing

- Aim for an ``actual`` integer refresh rate such as 60.00/240.00, not 59.94/239.76

- There are many ways to achieve the same outcome regarding GPU and display scaling. See the table in the link below for example scenarios

  - See [What Is Identity Scaling and How Can You Use It?](/docs/research.md#8-what-is-identity-scaling-and-how-can-you-use-it)

  - Optionally use [QueryDisplayScaling](https://github.com/valleyofdoom/QueryDisplayScaling) to query the current scaling mode

- On systems with an NVIDIA GPU, ensure that the ``Display`` option for the ``Perform scaling on`` setting is still available. If it is not, then find out what change you made in CRU results in it not being accessible through trial and error. This can be accomplished by running ``reset.exe`` to reset the settings to default then re-configure CRU. After each change, run ``restart64.exe`` then check whether the option is still available

- Ensure your resolution is configured properly by typing ``rundll32.exe display.dll,ShowAdapterSettings`` in ``Win+R``

<h2 id="open-shell-windows-8">11.27. Open-Shell (Windows 8+)</h2>

Open-Shell is a FOSS alternative to the Windows Start Menu.

- Download and install [Open-Shell](https://github.com/Open-Shell/Open-Shell-Menu). Only install the ``Open-Shell Menu``

- Settings:

  - General Behavior

    - Check for Windows updates on shutdown - Disable

- Windows 8 Only:

  - Open ``"C:\Program Files\Open-Shell\Start Menu Settings.lnk"``, enable ``Show all settings`` then navigate to the Windows 8 Settings section and set ``Disable active corners`` to ``All``

<h2 id="spectre-meltdown-and-cpu-microcode">11.28. Spectre, Meltdown and CPU Microcode</h2>

> [!WARNING]
> 🔒 Disabling Spectre and Meltdown may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Disabling Spectre and Meltdown is an age-old performance trick familiar amongst many individuals however with newer platforms and system architecture, there may be a performance regression ([1](https://www.phoronix.com/review/amd-zen4-spectrev2)). For this reason, extensive tests should be carried out to determine how performance is impacted and whether performance scales positively, negatively or not at all. Its state can be manipulated with the [InSpectre](https://www.grc.com/inspectre.htm) tool and/or by renaming the microcode DLLs within the OS depending on whether there is a microcode revision mismatch between the OS and BIOS ([1](https://superuser.com/a/895447), [2](https://support.mozilla.org/en-US/kb/microcode-update)). It is important to note that the microcode revisions are subject to change with Windows updates.

<details>
<summary>Instructions To Rename DLLs</summary>

Open CMD as TrustedInstaller with ``C:\bin\MinSudo.exe --TrustedInstaller --Privileged`` and enter the command below relevant to your CPU to remove the CPU microcode updates. To revert, simply swap the file names to restore the original DLL.

```
ren C:\Windows\System32\mcupdate_GenuineIntel.dll mcupdate_GenuineIntel.dlll
```

```
ren C:\Windows\System32\mcupdate_AuthenticAMD.dll mcupdate_AuthenticAMD.dlll
```

</details>

Meltdown does not affect the AMD architecture ([1](https://www.theverge.com/2018/1/3/16844630/intel-processor-security-flaw-bug-kernel-windows-linux), [2](https://www.phoronix.com/news/x86-PTI-Initial-Gaming-Tests), [3](https://lkml.org/lkml/2018/1/3/425)) and is required for a minority of anticheats (FACEIT).

Use [InSpectre](https://www.grc.com/inspectre.htm) and [CPU-Z's](https://www.cpuid.com/softwares/cpu-z.html) validation feature to check the status or version before and after a reboot to verify expected behavior.

<h2 id="power-options">11.29. Power Options</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

To be completed.

<h2 id="process-explorer">11.30. Process Explorer</h2>

Task Manager lacks several useful metrics compared to a tool such as Process Explorer. On Windows 8+, Task Manager reports CPU utility in % which provides misleading CPU utilization details ([1](https://aaron-margosis.medium.com/task-managers-cpu-numbers-are-all-but-meaningless-2d165b421e43)). On the other hand, Windows 7's Task Manager and Process Explorer report time-based busy utilization. This also explains as to why disabling idle states within the OS results in 100% CPU utilization in Task Manager.

- Download and extract [Process Explorer](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer)

- Copy ``procexp64.exe`` into a safe directory such as ``C:\Windows`` and open it

- Navigate to ``Options`` and select ``Replace Task Manager``. Optionally configure the following:

  - Confirm Kill

  - Allow Only One Instance

  - Always On Top (helpful for when applications crash and UI becomes unresponsive)

  - Enable the following columns for granular resource measurement metrics

    - Context Switch Delta (Process Performance)

    - CPU Cycles Delta (Process Performance)

    - Delta Reads (Process I/O)

    - Delta Writes (Process I/O)

    - Delta Other (Process I/O)

  - Enable the ``VirusTotal`` column

<h2 id="memory-management-settings-windows-8">11.31. Memory Management Settings (Windows 8+)</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

- Open PowerShell and enter the command below to review memory management options

    ```powershell
    Get-MMAgent
    ```

- Optionally use the command below as an example to disable a given setting. If you left Superfetch and Prefetch enabled in section [Superfetch and Prefetch](#superfetch-and-prefetch), then you likely want the prefetching related features enabled

    ```powershell
    Disable-MMAgent -MemoryCompression
    ```

<h2 id="network-adapter-options">11.32. Network Adapter Options</h2>

- Open ``Network Connections`` by typing ``ncpa.cpl`` in ``Win+R``

- Disable any unused network adapters then right-click your main one then select ``Properties``

- Disable ``NetBIOS over TCP/IP`` for all network adapters in ``Internet Protocol Version 4 (TCP/IPv4) -> Properties -> General -> Advanced -> WINS`` to prevent unnecessary system listening, typically on ports 137-139 which can be verified in a network monitoring tool such as [TCPView](https://learn.microsoft.com/en-us/sysinternals/downloads/tcpview) or [Wirehshark](https://www.wireshark.org). For future reference, this option has to be changed for newly installed network adapters

- Optionally configure DNS settings

  - See [DNS Resolvers - Recommended Providers | Privacy Guides](https://www.privacyguides.org/en/dns)

<h2 id="audio-devices">11.33. Audio Devices</h2>

- The sound control panel can be opened by typing ``mmsys.cpl`` in ``Win+R``

- Disable unused Playback and Recording devices

- I would recommend avoid using audio enhancements as they appear to marginally waste resources ([1](/assets/images/audio%20enhancements-benchmark.png))

- Optionally set the option in the communications tab to ``Do nothing`` to prevent automatic adjustment of audio levels between audio sources as this is an annoyance for the majority of users ([1](https://multimedia.easeus.com/ai-article/windows-audio-ducking.html), [2](https://superuser.com/questions/1147371/how-can-i-disable-automatic-windows-7-8-10-audio-ducking))

- Minimize the size of the audio buffer with [LowAudioLatency](https://github.com/spddl/LowAudioLatency) or on your DAC ([1](https://www.youtube.com/watch?v=JTuZvRF-OgE&t=464s)). Beware of audio dropouts due to the CPU not being able to keep up under load

<h2 id="device-manager">11.34. Device Manager</h2>

- Open Device Manager by typing ``devmgmt.msc`` in ``Win+R``

- Navigate to ``View -> Devices by type``

  - In the ``Disk drives`` category, you can disable write-cache buffer flushing on all drives in the ``Properties -> Policies`` section if your system has a backup power supply or is not prone to power failures to prevent data loss
  - In the ``Network adapters`` category, navigate to ``Properties -> Advanced`` and disable any power-saving features

- Navigate to ``View -> Devices by connection``

  - Disable any PCIe, SATA, NVMe and XHCI controllers and USB hubs with nothing connected to them
  - Disable every device that isn't the GPU on the same PCIe port as the GPU as long as you don't need them

- Navigate to ``View -> Resources by connection``

  - Disable any unneeded devices that are using an IRQ or I/O resources, always ask if unsure and take your time on this step
  - If there are multiple entries of the same devices and you are unsure which one is in use, refer back to the tree structure in ``View -> Devices by connection``. This is because a single device can use many resources (e.g. IRQs). You can also use [MSI Utility](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044) to check for duplicate and unneeded devices in case you accidentally miss any with the cluttered Device Manager tree structure

- Optionally use [DeviceCleanup](https://www.uwe-sieber.de/files/DeviceCleanup.zip) to remove hidden devices

<h2 id="device-power-saving">11.35. Device Power-Saving</h2>

Open PowerShell and enter the command below to disable the ``Allow the computer to turn off this device to save power`` option for all applicable devices in Device Manager.

Re-plugging devices may cause this option to re-enable so either avoid doing so, run this command again each time or place it in a script and run it at system startup as a precautionary measure with Task Scheduler ([instructions](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)). Ensure to wrap any paths with quotes if there are spaces in them. Ensure to verify whether everything is working correctly after a system restart. You need to enable the ``Run with highest privileges`` option if administrator privileges are required. For PowerShell scripts, set the program to start to ``PowerShell`` and the arguments to the path of the script (e.g. ``C:\device-power-saving.ps1``).

```powershell
Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | ForEach-Object { $_.enable = $false; $_.psbase.put(); }
```

<h2 id="event-trace-sessions-ets">11.36. Event Trace Sessions (ETS)</h2>

This section outlines instructions to mass-toggle Event Trace Sessions which can be viewed by typing ``perfmon`` in ``Win+R`` then navigating to ``Data Collector Sets -> Event Trace Sessions``. Programs that rely on event tracers will not be able to log data until the required sessions are restored (e.g. Windows Event Logging) which is the purpose of creating two registry files to toggle between them. Open CMD as administrator and enter the commands below to build the registry files in the ``C:\`` directory. These registry files must be run with Trusted Installer (use [NSudo](https://github.com/M2TeamArchived/NSudo/releases/latest)) to prevent permission errors.

- ``ets-enable.reg``

    ```bat
    reg export "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger" "C:\ets-enable.reg"
    ```

- ``ets-disable.reg``

    ```bat
    >> "C:\ets-disable.reg" echo Windows Registry Editor Version 5.00 && >> "C:\ets-disable.reg" echo. && >> "C:\ets-disable.reg" echo [-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger]
    ```

- Additionally disable SleepStudy (UserNotPresentSession)

    ```bat
    for %a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (wevtutil sl Microsoft-Windows-%~a/Diagnostic /e:false)
    ```

<h2 id="file-system">11.37. File System</h2>

Open CMD as administrator and enter the commands below.

- Disable the creation of 8.3 character-length file names on FAT and NTFS-formatted volumes

  - See [Should You Disable 8dot3 for Performance and Security? | TCAT Shelbyville](https://web.archive.org/web/20200217151754/https://ttcshelbyville.wordpress.com/2018/12/02/should-you-disable-8dot3-for-performance-and-security)

  - See [Windows Short (8.3) Filenames – A Security Nightmare? | Bogdan Calin](https://www.acunetix.com/blog/articles/windows-short-8-3-filenames-web-security-problem)

      ```bat
      fsutil behavior set disable8dot3 1
      ```

- Disable updates to the Last Access Time stamp on each directory when directories are listed on an NTFS volume. Disabling the Last Access Time feature improves the speed of file and directory access ([1](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-behavior#remarks)). Beware that this may affect backup and remote storage programs as per the official remarks ([1](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-behavior#remarks))

    ```bat
    fsutil behavior set disablelastaccess 1
    ```

<h2 id="message-signaled-interrupts">11.38. Message Signaled Interrupts</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Message signaled interrupts (MSIs) are faster than traditional line-based interrupts and may also resolve the issue of shared interrupts which are often the cause of high interrupt latency and stability ([1](https://repo.zenk-security.com/Linux%20et%20systemes%20d.exploitations/Windows%20Internals%20Part%201_6th%20Edition.pdf)).

- Download and open [MSI Utility](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044) or [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy)

- MSIs can be enabled on devices that support it. It is worth noting that it may be in the developer's intention to not enable MSIs in the driver INF file hence MSIs will be disabled by default once the driver is installed. Namely, NVIDIA seems to selectively enable MSIs depending on the GPU architecture ([1](https://www.nvidia.com/en-us/geforce/forums/game-ready-drivers/13/528356)). Exercise with due care and carry out tests to determine whether changes result in positive performance scaling

  - You will BSOD if you enable MSIs for the stock Windows 7 SATA driver which you should have already updated as mentioned in section [Installing Drivers](#installing-drivers)

- To verify whether a device is utilizing MSIs, restart your PC and check whether the given device has a negative IRQ in MSI Utility

- Although this step may have been caried out in an earlier section to rule out the hardware-related causes of IRQ sharing, the software-related causes of potential IRQ sharing can be assessed now by confirming that there is no IRQ sharing on your system by typing ``msinfo32`` in ``Win+R`` then navigating to the ``Conflicts/Sharing`` section

  - If the ``System timer`` device and ``High precision event timer`` are sharing IRQ 0, a solution to this is to disable the parent device's driver of ``System timer`` which is ``PCI standard ISA bridge``. This can be accomplished with the command below. It is important to note that disabling ``msisadrv`` breaks the keyboard on mobile devices

    ```bat
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\msisadrv" /v "Start" /t REG_DWORD /d "4" /f
    ```

> [!IMPORTANT]
> To prevent unexpected breakage and problems due to service dependency errors, assess the other services that depend on the service you want to disable. This can be done by opening CMD as administrator then typing ``sc EnumDepend <service>`` which describes the services that rely on the service you want to disable. These services should be disabled to avoid dependency errors. If you can't disable them (e.g. because you need them), then you have no choice but to leave the service you wanted to disable initially enabled.

<h2 id="xhci-interrupt-moderation-imod">11.39. XHCI Interrupt Moderation (IMOD)</h2>

On most systems, Windows 7 uses an IMOD interval of 1ms whereas recent versions of Windows use 0.05ms (50us) unless specified by the installed USB driver. This means that after an interrupt has been generated, the XHCI controller waits (buffer period) for the specified interval for more data to arrive before generating another interrupt which reduces CPU utilization but potentially results in data from a given device being supplied at an inconsistent rate in the event of expecting data from other devices within the buffer period that are connected to the same XHCI controller.

For example, a mouse with a 1kHz polling rate will report data every 1ms. While only moving the mouse with an IMOD interval of 1ms, interrupt moderation will not be taking place because interrupts are being generated at a rate less than or equal to the specified interval. Realistically while playing a fast-paced game, you will easily surpass 1000 interrupts/s with keyboard and audio interaction while moving the mouse hence there will be a loss of information because you will be expecting data within the waiting period from either devices. Although this is unlikely with an IMOD interval of 0.05ms (50us), it can still happen.

As an example, 1ms IMOD interval with an 8kHz mouse is already problematic because you are expecting data every 0.125ms which is significantly greater than the specified interval which results in a major bottleneck ([1](https://www.overclock.net/threads/usb-polling-precision.1550666/page-61#post-28576466)).

- See [How to persistently disable XHCI Interrupt Moderation | BoringBoredom](https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/xhci%20imod/xhci%20imod.md)

- Microsoft Vulnerable Driver Blocklist may need to be disabled with the command below in order to load the [RWEverything](http://rweverything.com) driver however a handful of in-game anticheats do not adhere to disabling the blocklist (e.g. CS2, THE FINALS)

    ```bat
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f
    ```

- In some cases, the interrupter index can change after a reboot meaning the address will become invalid if it is hard-coded. To work around this, you can simply disable IMOD for all interrupters by placing the [XHCI-IMOD-Interval.ps1](/bin/XHCI-IMOD-Interval.ps1) script somewhere safe and launching it at startup with Task Scheduler ([instructions](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)). Ensure to wrap any paths with quotes if there are spaces in them. Ensure to verify whether everything is working correctly after a system restart. You need to enable the ``Run with highest privileges`` option if administrator privileges are required. For PowerShell scripts, set the program to start to ``PowerShell`` and the arguments to the path of the script (e.g. ``C:\XHCI-IMOD-Interval.ps1``)

  ```bat
  PowerShell C:\XHCI-IMOD-Interval.ps1
  ```

- To determine whether changing the IMOD interval is taking effect, you can temporarily set the interval to ``0xFA00`` (62.5Hz). If the mouse cursor is visibly stuttering upon movement, then the changes are successfully taking effect

<h2 id="control-panel">11.40. Control Panel</h2>

It isn't a bad idea to skim through both the legacy and immersive control panel to ensure nothing is misconfigured.

<h2 id="configuring-applications">11.41. Configuring Applications</h2>

- Install any programs and applications that you use (including games) to prepare us for the next steps

- If applicable, favor portable editions of programs as installers tend to leave bloatware behind even after uninstalling them however, this can be circumvented by using programs such as [Bulk-Crap-Uninstaller](https://github.com/Klocman/Bulk-Crap-Uninstaller)

<h3 id="nvidia-reflex">11.41.1. NVIDIA Reflex</h3>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

[NVIDIA Reflex](https://www.nvidia.com/en-us/geforce/news/reflex-low-latency-platform) minimizes queued frames in the GPU render queue by dynamically adjusting the framerate in GPU-intensive gaming scenarios and can be enabled in-game if the developer has added support for it. Although this minimizes latency, it acts as a dynamic framerate limiter and can result in minor stuttering or frametime variance. For this reason, I would recommend extensively benchmarking this rather than blindly enabling it in your chosen games.

- See [NVIDIA Reflex Low Latency - How It Works & Why You Want To Use It | Battle(non)sense](https://www.youtube.com/watch?v=QzmoLJwS6eQ)

<h3 id="framerate-limit">11.41.2. Framerate Limit</h3>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

- If you cap your framerate, ensure to set it at a multiple of your monitor refresh rate ([calculator](https://boringboredom.github.io/tools/fpscapcalculator)) to prevent frame mistiming and a rolling tearline ([1](https://www.youtube.com/watch?v=_73gFgNrYVQ), [2](https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/peripherals/mistiming/mistiming.md)). Reducing your refresh rate to avoid mismatching is also applicable ([instructions](https://forums.blurbusters.com/viewtopic.php?t=8946)). Other options include Variable Refresh Rate

- Ensure that the GPU isn't fully utilized as lower GPU utilization reduces system latency ([1](https://www.youtube.com/watch?v=8ZRuFaFZh5M&t=859s), [2](https://www.youtube.com/watch?v=7CKnJ5ujL_Q))

- Capping your framerate with [RTSS](https://www.guru3d.com/files-details/rtss-rivatuner-statistics-server-download.html) instead of the in-game limiter will result in consistent frame pacing and a smoother experience as it utilizes busy-wait which offers higher precision than 100% passive-waiting but at the cost of noticeably higher latency and potentially greater CPU overhead ([1](https://www.youtube.com/watch?t=377&v=T2ENf9cigSk), [2](https://en.wikipedia.org/wiki/Busy_waiting)). Disabling the ``Enable dedicated encoder server service`` setting prevents ``EncoderServer.exe`` from running

<h3 id="register-game">11.41.3. Register Game in Config Store</h3>

Ensure that Xbox Game Bar acknowledges the game that you are running or have installed. If not, open Game Bar by pressing ``Win+G`` and enabling ``Remember this is a game`` while it is open. This also ensures that Game Mode functions properly if you choose to use it.

<h3 id="presentation-mode">11.41.4. Presentation Mode</h3>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

This is not a recommendation of what presentation mode to use and is instead, here for informative purposes.

- Always verify whether your game is using the desired presentation mode with PresentMon ([instructions](https://boringboredom.github.io/Frame-Time-Analysis))

- You can experiment and benchmark different presentation modes to assess which you prefer

  - See [Presentation Model | Special K Wiki](https://wiki.special-k.info/en/Presentation_Model)

- If there are no results after searching for the application's binary name in ``HKCU\SYSTEM\GameConfigStore`` within registry, you may need to register the game by pressing ``Win+G`` and enabling ``Remember this is a game`` while it is open. Check whether the entry has been created under the aforementioned registry key once completed

- If you want to use the ``Hardware: Legacy Flip`` presentation mode, tick the ``Disable fullscreen optimizations`` checkbox. If that doesn't work, try running the commands below in CMD and reboot. These registry keys are typically accessed by the game and Windows upon launch

    ```bat
    reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
    ```

    ```bat
    reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
    ```

- If you are stuck with ``Hardware Composed: Independent Flip`` and would like to use another presentation mode, try running the command below to disable MPOs in CMD and reboot

    ```bat
    reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /t REG_DWORD /d "5" /f
    ```

<h3 id="game-mode">11.41.5. Game Mode</h3>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Game Mode prevents Windows Update running and certain notifications from being pushed to the user ([1](https://support.xbox.com/en-GB/help/games-apps/game-setup-and-play/use-game-mode-gaming-on-pc)).

It is worth noting that Game Mode can intefere with process and thread priority boosts depending on the value of PsPrioritySeparation as explained in section [Thread Quantums and Scheduling](#thread-quantums-and-scheduling). This is evident by replicating the listening to thread priority boosts experiment in Windows Internals using Performance Monitor and the thread current priority performance counter. For this reason, you can experiment with Game Mode enabled and disabled.

<h3 id="media-player">11.41.6. Media Player</h3>

- [mpv](https://mpv.io) or [mpv.net](https://github.com/stax76/mpv.net)
- [mpc-hc](https://mpc-hc.org) ([updated fork](https://github.com/clsid2/mpc-hc))
- [VLC](https://www.videolan.org)

<h3 id="qos-policies">11.41.7. QoS Policies</h3>

Depending on your network and router configuration, QoS policies can be set in Windows to prioritize packets of an application.

- See [assets/images/dscp-46-qos-policy.png](/assets/images/dscp-46-qos-policy.png)

  - See [DSCP and Precedence Values | Cisco](https://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus1000/sw/4_0/qos/configuration/guide/nexus1000v_qos/qos_6dscp_val.pdf)

  - See [The QoS Expedited Forwarding (EF) Model | Network World](https://www.networkworld.com/article/761413/the-qos-expedited-forwarding-ef-model.html)

- See [How Can You Verify Whether a DSCP QoS Policy Is Working?](/docs/research.md#2-how-can-you-verify-whether-a-dscp-qos-policy-is-working)

- Microsoft recommend the registry entry below to ensure packets are correctly tagged with the DSCP value, especially when more than one network adapter is present or the policy is used outside a domain ([1](https://learn.microsoft.com/en-us/skypeforbusiness/manage/network-management/qos/configuring-port-ranges-for-your-skype-clients))

  ```bat
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_SZ /d "1" /f
  ```

<h2 id="kernel-mode-scheduling-interrupts-dpcs-and-more">11.42. Kernel-Mode Scheduling (Interrupts, DPCs and more)</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Windows schedules interrupts and DPCs on CPU 0 for several kernel-mode modules by default. In any case, scheduling many tasks on a single CPU can introduce additional overhead and increased jitter due to them competing for CPU time. To alleviate this, affinities can be configured to isolate given modules from disturbances including servicing time-sensitive modules on underutilized CPUs instead of clumping everything on a single CPU.

- Use the xperf DPC/ISR report generated by the [xperf-dpcisr.bat](/bin/xperf-dpcisr.bat) script to analyze which CPUs kernel-mode modules are being serviced on. You can not manage affinities if you do not know what is running and which CPU(s) they are running on to begin with. The same concept applies to user-mode threads. Additionally, verify whether interrupt affinity policies are performing as expected by analyzing per-CPU usage for the module in question while the device is busy

- Additionally, core-to-core-latency benchmarks can assist with decision-making in terms of affinity management

  - See [CXWorld/MicroBenchX](https://github.com/CXWorld/MicroBenchX)

- Ensure that the corresponding DPC for an ISR is processed on the same CPU ([example](/assets/images/isr-dpc-same-core.png)). Additional overhead can be introduced if they are processed on different CPUs due to increased inter-processor communication and interfering with cache coherence

- Use [Microsoft Interrupt Affinity Tool](https://www.techpowerup.com/download/microsoft-interrupt-affinity-tool) or [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy) to configure driver affinities. The device can be identified by cross-checking the ``Location`` in the ``Properties -> General`` section of a device in Device Manager

<h3 id="gpu-and-directx-graphics-kernel">11.42.1. GPU and DirectX Graphics Kernel</h3>

[AutoGpuAffinity](https://github.com/valleyofdoom/AutoGpuAffinity) can be used to benchmark the most performant CPUs that the GPU-related modules are assigned to. Configure the ``custom_cpus`` option in the config file if applicable. This option is useful for selecting a certain set of cores to benchmark such as P-Cores or a specific CCX/CCD.

<h3 id="xhci-and-audio-controller">11.42.2. XHCI and Audio Controller</h3>

The XHCI and audio controller related modules generate a substantial amount of interrupts upon interaction respective of the relevant device. Isolating the related modules to an underutilized CPU is beneficial for reducing contention.

<h3 id="network-interface-card">11.42.3. Network Interface Card</h3>

The NIC must support MSI-X for Receive Side Scaling to function properly ([1](https://old.reddit.com/r/intel/comments/9uc03d/the_i219v_nic_on_your_new_z390_motherboard_and)). In most cases, RSS base CPU is enough to migrate DPCs and ISRs for the NIC driver which eliminates the need for an interrupt affinity policy. However, if you are having trouble migrating either to other CPUs, try configuring both.

Keep in mind that the amount of RSS queues determines the amount of consecutive CPUs that the network driver is scheduled on. For example, the driver will be scheduled on CPU 2/3/4/5 (2/4/6/8 with HT/SMT enabled) if RSS base CPU is set to 2 along with 4 RSS queues configured.

- See [How many RSS Queues do you need?](/docs/research.md#4-how-many-rss-queues-do-you-need)

- See [Receive Side Scaling (RSS) Configuration](https://github.com/Duckleeng/TweakCollection#receive-side-scaling-rss-configuration)

<h2 id="user-mode-scheduling-processes-threads">11.43. User-Mode Scheduling (Processes, Threads)</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

There are several methods to set affinities for processes. One of which is Task Manager but only persists until the process is closed. A more popular and permanent solution is [Process Lasso](https://bitsum.com) which allows the configuration to be saved however, a process must run continually in the background which introduces minor overhead. To work around this, you can simply launch the application with a specified CPU affinity which eliminates the requirement of programs such as Process Lasso for affinity management at the expense of usability.

- Use the [CPU Affinity Mask Calculator](https://bitsum.com/tools/cpu-affinity-calculator) to determine the desired hexal affinity bitmask

- In some cases, process can be protected so specifying the affinity may fail. To work around this, you can try specifying the affinity for the parent processes which will cause the child process to inherit the affinity when spawned. As an example, a game launcher is usually the parent process of a game. [Process Explorer's](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer) process tree can be used to identify parent and child processes

  - [Process Hacker](https://processhacker.sourceforge.io) and [WindowsD](https://github.com/katlogic/WindowsD) can bypass several process-level protections through exploits but is not advised as they interfere with anticheats

- It may be worth benchmarking the performance scaling of your application against core count as it may behave differently due to poor scheduling implementations from the application and/or OS. In some cases, it is possible that the application may perform better with fewer cores assigned to it via an affinity mask ([1](https://developer.nvidia.com/blog/limiting-cpu-threads-for-better-game-performance)). This will also give you a rough idea as to how many cores you can reserve. In other cases, it can severely harm performance as there is a potential for the game to create more worker threads than CPUs due to the game only considering the amount of physical cores available hence, it is vital that performance scaling is measured

<h3 id="starting-a-process-with-a-specified-affinity-mask">11.43.1. Starting a Process with a Specified Affinity Mask</h3>

The command below starts ``notepad.exe`` with an affinity of CPU 1 and CPU 2 as an example which will reflect in Task Manager. This command can be placed in a batch script for easy access and must be used each time to start the desired application with the specified affinity.

```bat
start /affinity 0x6 notepad.exe
```

<h3 id="specifying-an-affinity-mask-for-running-processes">11.43.2. Specifying an Affinity Mask for Running Processes</h3>

Sometimes, the processes that you would like to set an affinity mask to are already running, so the previous command is not applicable here. As a random example, the command below sets the affinity mask of the ``svchost.exe`` and ``audiodg.exe`` processes to CPU 3. Use this example to create a PowerShell script then have it run at startup using Task Scheduler ([instructions](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)). Ensure to wrap any paths with quotes if there are spaces in them. Ensure to verify whether everything is working correctly after a system restart. You need to enable the ``Run with highest privileges`` option if administrator privileges are required. For PowerShell scripts, set the program to start to ``PowerShell`` and the arguments to the path of the script (e.g. ``C:\process-affinities.ps1``).

```powershell
Get-Process @("svchost", "audiodg") -ErrorAction SilentlyContinue | ForEach-Object { $_.ProcessorAffinity=0x8 }
```

<h2 id="reserved-cpu-sets-windows-10">11.44. Reserved CPU Sets (Windows 10+)</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

[ReservedCpuSets](https://github.com/valleyofdoom/ReservedCpuSets) can be used to prevent Windows routing ISRs, DPCs and scheduling other threads on specific CPUs. Isolating modules from user and kernel-level disturbances helps reduce contention, jitter and allows time-sensitive modules to get the CPU time they require.

- As mentioned in section [User-Mode Scheduling (Processes, Threads)](#user-mode-scheduling-processes-threads), you should determine how well or poorly your application's performance scales with core count to give you a rough idea as to how many cores you can afford to reserve

- As interrupt affinity policies, process and thread affinities have higher precedence, you can use this hand in hand with user-defined affinities to go a step further and ensure that nothing except what you assigned to specific CPUs will be scheduled on those CPUs

- Ensure that you have enough cores to run your real-time application on and aren't reserving too many CPUs to the point where isolating modules does not yield real-time performance

- As CPU sets are considered soft policies, the configuration isn't guaranteed. A CPU-intensive process such as a stress-test will utilize the reserved cores if required

> [!IMPORTANT]
> Unexpected behavior occurs when a process affinity is set to both reserved and unreserved CPUs. Ensure to set the affinity to either reserved or unreserved CPUs, not a combination of both.

<h3 id="use-cases">11.44.1. Use Cases</h3>

- Hinting to the OS to schedule tasks on a group of CPUs. An example of this with modern platforms could be reserving E-Cores (efficiency cores) or either CCX/CCDs so that tasks are scheduled on P-Cores (performance cores) or other CCX/CCDs by default. With this approach, you can explicitly enforce background and unimportant tasks to be scheduled on the reserved CPUs. Note that this is purely an example and the logic can be flipped, but some latency-sensitive processes and modules are protected so affinity policies may fail which is a major limitation. There are several possibilities and trade-offs to consider. Note that performance can degrade when reserving E-Cores or other CCX/CCDs as applications may make use of them. Therefore, it is vital that you measure performance scaling when reserving cores whether it be one, a few or a set of CPUs. Another way of severly degrading performance by reserving E-Cores or CCX/CCDs is that the scheduler or applications can specifically target reserved cores for work to be scheduled on them as the ``RealTime`` field is set to 1 in the [SYSTEM_CPU_SET_INFORMATION](https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-system_cpu_set_information) struct

- Reserving CPUs that have specific modules assigned to be scheduled on them

<h2 id="analyzing-event-viewer">11.45. Analyzing Event Viewer</h2>

This step isn't required, but can help to justify unexplained performance issues or issues in general. Ensure that there are no errors present on Event Viewer by typing ``eventvwr.msc`` in ``Win+R`` as anything you may have changed to your operating system could lead to internal errors or exceptions being thrown periodically.

- Merge the ``ets-enable.reg`` file that was generated in section [Event Trace Sessions (ETS)](#event-trace-sessions-ets) if applicable as it is required for event logging

<h2 id="virtualization-based-security-vbs">11.46. Virtualization Based Security (VBS)</h2>

Virtualization Based Security negatively impacts performance ([1](https://www.tomshardware.com/news/windows-11-gaming-benchmarks-performance-vbs-hvci-security)) and in some cases, it is enabled by default. Its status can be determined by typing ``msinfo32`` in ``Win+R`` and can be disabled ([1](https://www.tomshardware.com/how-to/disable-vbs-windows-11), [2](https://support.microsoft.com/en-us/windows/options-to-optimize-gaming-performance-in-windows-11-a255f612-2949-4373-a566-ff6f3f474613)) if required. On the other hand, [privacyguides.org](https://www.privacyguides.org/en/os/windows/group-policies/) recommend keeping it enabled. VBS should be disabled when virtualization is disabled in BIOS, so be careful of VBS being enabled if you enable virtualization in BIOS for future reference.

<h2 id="cpu-idle-states">11.47. CPU Idle States</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

Disabling idle states forces C-State 0, which can be seen in [HWiNFO](https://www.hwinfo.com), and is in Microsoft's recommendations for configuring devices for real-time performance ([1](https://learn.microsoft.com/en-us/windows/iot/iot-enterprise/soft-real-time/soft-real-time-device)). Forcing C-State 0 mitigates the undesirable delay to execute new instructions on a CPU that has entered a deeper power-saving state at the expense of higher temperatures and power consumption. Therefore, I would recommend keeping idle states enabled for the majority of readers as other problems can occur due to these side effects (e.g. throttling, power issues). The CPU temperature should not increase to the point of thermal throttling because you should have already assessed that in section [Stability, Hardware Clocking and Thermal Performance](#stability-hardware-clocking-and-thermal-performance).

If a static CPU frequency is not set, the effects of forcing C-State 0 should be assessed in terms of frequency boosting behavior. For example, you certainly wouldn't want to disable idle states when relying on Precision Boost Overdrive (PBO), Turbo Boost or similar features. Avoid disabling idle states with Hyper-Threading/Simultaneous Multithreading enabled as single-threaded performance is usually negatively impacted.

<h3 id="enable-idle-states-default">11.47.1. Enable Idle States (default)</h3>

```bat
powercfg /setacvalueindex scheme_current sub_processor 5d76a2ca-e8c0-402f-a133-2158492d58ad 0 && powercfg /setactive scheme_current
```

<h3 id="disable-idle-states">11.47.2. Disable Idle States</h3>

```bat
powercfg /setacvalueindex scheme_current sub_processor 5d76a2ca-e8c0-402f-a133-2158492d58ad 1 && powercfg /setactive scheme_current
```

<h2 id="thread-quantums-and-scheduling">11.48. Thread Quantums and Scheduling</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

A quantum is the time designated for which a thread can execute before the scheduler evaluates whether another thread with the same priority is scheduled to execute. If a thread finishes its quantum and no other threads at its priority level are ready to execute, the scheduler allows the thread to continue running for an additional quantum. The quantum can be controlled with the registry key below, in addition to defining how much time of the quantum is allocated to background and foreground threads. The value is represented as a 6-bit bitmask such that each of the three pairs of bits determine the quantum's characteristics and distribution of time between background and foreground threads. By default, it is set to ``0x2`` which corresponds to ``0b000010`` and has different meanings on client and server editions as explained shortly.

```
[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl]
"Win32PrioritySeparation"=dword:00000002
```

<h3 id="bitmask-explaination">11.48.1. Bitmask Explaination</h3>

- The leftmost bit pair (**XX**YYZZ) determine the quantum length. This is represented by ``PspForegroundQuantum``

  |Value|Description|
  |---|---|
  |00/11|Short Intervals (Windows Client), Long Intervals (Windows Server)|
  |01|Long Intervals|
  |10|Short Intervals|

- The middle bit pair (XX**YY**ZZ) determine whether the quantum length is variable or fixed. If a fixed-length quantum is used, then the rightmost bit pair is ignored as the ratio that determines the time allocated to background and foreground threads within the quantum is fixed. This is represented by ``PspForegroundQuantum``

  |Value|Description|
  |---|---|
  |00/11|Variable-length (Windows Client), Fixed-length (Windows Server)|
  |01|Variable-length|
  |10|Fixed-length|

- The rightmost bit pair (XXYY**ZZ**) determine the ratio of time in the quantum allocated to background and foreground threads in which, foreground threads can be allocated up to three times as much processor time than background threads. As mentioned previously, this can only be configured with variable-length quantums. This is represented by ``PsPrioritySeparation``

  |Value|Description|
  |---|---|
  |00|1:1|
  |01|2:1|
  |10/11|3:1|

- Using the information above, the default value of ``0x2`` corresponds to short, variable-length, 3:1 on Windows Client and long, fixed-length, 3:1 on Windows Server

<h3 id="win32priorityseparation-values">11.48.2. Win32PrioritySeparation Values</h3>

The table below consists of all possible values that are consistent between client and server editions of Windows as ``00`` or ``11`` were not used in **XXYY**ZZ of the bitmask which have different meanings on client and server editions. Any value not specified in the table is identical to one that is stated in the table as explained [here](/docs/research.md#5-ambiguous-win32priorityseparation-values-explained), hence the values in the table are the only ones that should be used. The time in milliseconds are based on the modern x86/x64 multiprocessor timer resolution.

Although a foreground boost can not be used when using a fixed length interval in terms of the quantum, PsPrioritySeparation still changes, and another thread priority boosting mechanism just happens to use the value of it so in reality, a fixed 3:1 quantum should have a perceivable difference compared to a fixed 1:1 quantum. See the paragraph below from Windows Internals.

> As will be described shortly, whenever a thread in the foreground process completes a wait operation on
a kernel object, the kernel boosts its current (not base) priority by the current value of
PsPrioritySeparation. (The windowing system is responsible for determining which process is
considered to be in the foreground.) As described earlier in this chapter in the section “Controlling the
quantum,” PsPrioritySeparation reflects the quantum-table index used to select quantums for the
threads of foreground applications. However, in this case, it is being used as a priority boost value.

For the majority of readers, I would simply recommend leaving it at default. Although, a mixture of the quantum length and foreground/background time allocation ratio can influence how often a thread switches context depending on whether thread's runtime exceeds its allocated time in the quantum as described previously hence you can benchmark whether it influences performance in your chosen applications if desired. If you are using Windows Server on a desktop system, the value can be set to ``0x26`` which mimics the same behavior as ``0x2`` does on Windows Client editions.

|**Hexadecimal**|**Decimal**|**Binary**|**Interval**|**Length**|**PsPrioSep**|**ForegroundQU**|**BackgroundQU**|**TotalQU**|
|---|---|---|---|---|---|---|---|---|
|0x14|20|0b010100|Long|Variable|0|12 (62.50ms)|12 (62.50ms)|24 (125.00ms)|
|0x15|21|0b010101|Long|Variable|1|24 (125.00ms)|12 (62.50ms)|36 (187.50ms)|
|0x16|22|0b010110|Long|Variable|2|36 (187.50ms)|12 (62.50ms)|48 (250.00ms)|
|0x18|24|0b011000|Long|Fixed|0|36 (187.50ms)|36 (187.50ms)|72 (375.00ms)|
|0x19|25|0b011001|Long|Fixed|1|36 (187.50ms)|36 (187.50ms)|72 (375.00ms)|
|0x1A|26|0b011010|Long|Fixed|2|36 (187.50ms)|36 (187.50ms)|72 (375.00ms)|
|0x24|36|0b100100|Short|Variable|0|6 (31.25ms)|6 (31.25ms)|12 (62.50ms)|
|0x25|37|0b100101|Short|Variable|1|12 (62.50ms)|6 (31.25ms)|18 (93.75ms)|
|0x26|38|0b100110|Short|Variable|2|18 (93.75ms)|6 (31.25ms)|24 (125.00ms)|
|0x28|40|0b101000|Short|Fixed|0|18 (93.75ms)|18 (93.75ms)|36 (187.5ms)|
|0x29|41|0b101001|Short|Fixed|1|18 (93.75ms)|18 (93.75ms)|36 (187.5ms)|
|0x2A|42|0b101010|Short|Fixed|2|18 (93.75ms)|18 (93.75ms)|36 (187.5ms)|

<h2 id="clock-interrupt-frequency-timer-resolution">11.49. Clock Interrupt Frequency (Timer Resolution)</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

The clock interrupt frequency is the rate at which the system's hardware clock generates interrupts which allow the scheduler to perform various tasks such as timekeeping. On most systems by default, the minimum frequency is 64Hz, meaning that a clock interrupt is generated every 15.625ms. A lower frequency results in reduced CPU overhead and power consumption due to fewer interrupts but reduces timing precision and results in potentially less responsive multitasking. The maximum frequency is 2kHz, meaning that a clock interrupt is generated every 0.5ms. A higher frequency results in higher timing precision, potentially higher multitasking responsiveness but increases CPU overhead and power consumption. The minimum, current and maximum resolutions can be viewed in [ClockRes](https://learn.microsoft.com/en-us/sysinternals/downloads/clockres).

Applications that require higher precision than the default resolution of 15.625ms are able to raise the clock interrupt frequency through functions such as [timeBeginPeriod](https://learn.microsoft.com/en-us/windows/win32/api/timeapi/nf-timeapi-timebeginperiod) and [NtSetTimerResolution](http://undocumented.ntinternals.net/index.html?page=UserMode%2FUndocumented%20Functions%2FTime%2FNtSetTimerResolution.html) in which, these scenarios typically consist of multimedia playback, gaming, VoIP activity and more which can be seen by running an energy trace ([instructions](https://support.microsoft.com/en-gb/topic/guided-help-get-a-detailed-power-efficiency-diagnostics-report-for-your-computer-in-windows-7-3f6ce138-fc04-7648-089a-854bcf332810)) during runtime. The precision of features that rely on sleep-related functions to pace events are directly influenced by the clock interrupt frequency ([1](https://randomascii.wordpress.com/wp-content/uploads/2020/10/image-5.png)). Using [Sleep](https://learn.microsoft.com/en-us/windows/win32/api/synchapi/nf-synchapi-sleep) as an example, ``Sleep(n)`` should sleep for n milliseconds in actuality and not n plus/minus an arbitrary value otherwise, it can result in unexpected and inconsistent event pacing which is not ideal for features such as sleep-based framerate limiters. Note that this is an example and many real-world applications do not rely specifically on the ``Sleep`` function for event pacing. A typical value that developers appears to raise the resolution to is 1ms which means that the application can maintain a pace of events within a resolution of 1ms. In very rare cases, developers may not raise the resolution at all while their application relies on it for event pacing precision leading to breakage, but this is not common and may be applicable to some obscure programs such as lesser-known games.

The implementation of timer resolution changed in Windows 10 2004+ such that the calling process raising the resolution does not affect the system on a global level meaning, process A raising the resolution to 1ms does not affect process B at the default 15.625ms resolution unlike before. This is a great change in and of itself because it reduces overhead as other processes such as idle background processes don't get serviced by the scheduler often and the calling process receives higher precision as needed. However as an end-user, this results in limitations when wanting to leverage higher resolutions such as 0.5ms.  Given that games are not open-source to modify the code along with anticheat limitations preventing DLL injection or binary patching to raise the resolution beyond 1ms the per-process way, the only other option is to resort to the global behavior which is applicable with the registry key below on Windows Server and Windows 11+ as explained in depth [here](/docs/research.md#6-fixing-timing-precision-in-windows-after-the-great-rule-change).

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"GlobalTimerResolutionRequests"=dword:00000001
```

This provides the ability to raise the resolution in a separate process which in turn, results in the desired application such as a game receiving higher precision. However as mentioned previously, the per-process implantation reduces overhead which is no longer the case when the global behavior is restored and background processes are also serviced unnecessarily often. [RTSS](https://www.guru3d.com/download/rtss-rivatuner-statistics-server-download) is an alternative method for framerate limiting and utilizes hybrid-wait which results in greater precision while eliminating the need for restoring the global behavior.

A higher resolution results in higher precision, but in some cases, the maximum supported resolution of 0.5ms provides less precision than something slightly lower such as 0.507ms ([1](/docs/research.md#7-micro-adjusting-timer-resolution-for-higher-precision)). Therefore, it is sensible to determine what calling resolution provides the highest precision (the lowest deltas) in the [MeasureSleep](https://github.com/valleyofdoom/TimerResolution) program while requesting different resolutions with the [SetTimerResolution](https://github.com/valleyofdoom/TimerResolution) program. This should be carried out under load as idle benchmarks may be misleading. The [micro-adjust-benchmark.ps1](https://github.com/valleyofdoom/TimerResolution) script can be used to automate the process.

To conclude my view on the topic, I recommend favoring the per-process (non-global) implementation where applicable as it reduces overhead and instead use [RTSS](https://www.guru3d.com/download/rtss-rivatuner-statistics-server-download) for precise framerate limiting. It is worth noting that it can introduce noticeably higher latency ([1](https://www.youtube.com/watch?t=377&v=T2ENf9cigSk), [2](https://en.wikipedia.org/wiki/Busy_waiting)) therefore I recommend comparing and benchmarking it against micro-adjusting the requested resolution for higher precision with the global behavior. It is possible that frametime stability is unaffected by raising the resolution beyond 1ms due to improvements in the in-game framerate limiter which in that case, no action is required. The primary point I want to convey is to compare all available options, with a preference of using the per-process behavior which is the default on Windows 10 2004+ if you find that raising the resolution further has little to no impact.

<h2 id="paging-file">11.50. Paging File</h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#benchmarking)).

For most readers, I would recommend keeping the paging file enabled which is the default state. There is an argument that it is preferable to disable it if you have enough RAM for your applications as it reduces I/O overhead and that system memory is faster than disk however, many users have reported in-game stuttering in specific games with the paging file disabled despite being nowhere near maximum RAM load. Windows appears to allocate the page file to secondary drives sometimes which can be problematic if one of the drives is a HDD. This can be resolved by allocating the page file to an SSD and its size to "system managed size" then deallocating it on other drives.

<h2 id="cleanup-and-maintenance">11.51. Cleanup and Maintenance</h2>

It isn't a bad idea to revisit this step every so often. Setting a reminder to do so can be helpful in maintaining a clean system.

- Favor tools such as [Bulk-Crap-Uninstaller](https://github.com/Klocman/Bulk-Crap-Uninstaller) to uninstall programs as the regular control panel does not remove residual files

- Use [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns) to remove any unwanted programs from launching at startup and check it often, especially after installing a program

- Configure Disk Cleanup

  - Open CMD and enter the command below, tick all the boxes except ``DirectX Shader Cache`` then press ``OK``

      ```bat
      cleanmgr /sageset:0
      ```

  - Run Disk Cleanup

      ```bat
      cleanmgr /sagerun:0
      ```

- Some locations you may want to review for residual files

  - ``C:\`` - residual junk
  - ``"C:\ProgramData\Microsoft\Windows\Start Menu\Programs"`` - start menu shortcuts (don't delete windows-related shortcuts)
  - ``C:\Windows\Prefetch`` - prefetch files (this folder should not be populated when superfetch is disabled)
  - ``C:\Windows\SoftwareDistribution`` - Windows Update download cache
  - ``C:\Windows\Temp`` - temporary files
  - ``"%userprofile%"`` - residual junk
  - ``"%userprofile%\AppData\Local\Temp"`` - temporary files
  - ``"%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"`` - start menu shortcuts (don't delete windows-related shortcuts)
  - User directories - e.g. Downloads, Documents, Pictures, Music, Videos, Desktop

- Optionally clean the WinSxS folder to reduce the size of it ([1](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/clean-up-the-winsxs-folder?view=windows-11)) with the command below in CMD. Note that this can be a lengthy process

    ```bat
    DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
    ```

- Optionally delete obsolete system restore points in the ``System Protection`` tab by typing ``sysdm.cpl`` in ``Win+R``. It can be disabled completely if you don't use it
