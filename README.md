
> [!CAUTION]
> **Do NOT** blindly trust or believe everything you see online (including this resource) and avoid applying or using random, unknown or undocumented changes, programs and scripts on your system without a comprehensive understanding of what they are changing and impact they have on security, privacy and performance. Instead, carry out research and benchmarks yourself to validate whatever you may have read.

# 1. Table of Contents

- [1. Table of Contents](#1-table-of-contents)
- [2. Introduction](#2-introduction)
- [3. Benchmarking](#3-benchmarking)
- [4. Physical Setup](#4-physical-setup)
- [5. Cooling](#5-cooling)
- [6. BIOS/UEFI](#6-biosuefi)
  - [6.1. Partition Style](#61-partition-style)
  - [6.2. Consider Windows Version](#62-consider-windows-version)
  - [6.3. BIOS Recovery Methods](#63-bios-recovery-methods)
  - [6.4. BIOS Updates](#64-bios-updates)
  - [6.5. BIOS Microcode](#65-bios-microcode)
  - [6.6. Accessing Hidden Options](#66-accessing-hidden-options)
  - [6.7. Disable Unnecessary Devices](#67-disable-unnecessary-devices)
  - [6.8. Resizable Bar](#68-resizable-bar)
  - [6.9. Hyper-Threading/Simultaneous Multithreading](#69-hyper-threadingsimultaneous-multithreading)
  - [6.10. Power States](#610-power-states)
  - [6.11. Virtualization/SVM Mode](#611-virtualizationsvm-mode)
  - [6.12. Power-Saving](#612-power-saving)
  - [6.13. Trusted Platform Module (TPM)](#613-trusted-platform-module-tpm)
  - [6.14. Compatibility Support Module (CSM)](#614-compatibility-support-module-csm)
  - [6.15. Secure Boot](#615-secure-boot)
  - [6.16. Fast Startup, Standby and Hibernate](#616-fast-startup-standby-and-hibernate)
  - [6.17. Spread Spectrum](#617-spread-spectrum)
  - [6.18. Legacy USB Support](#618-legacy-usb-support)
  - [6.19. Disable Software Installation Options](#619-disable-software-installation-options)
  - [6.20. Configure PCI Link Speed for Devices](#620-configure-pci-link-speed-for-devices)
  - [6.21. Fan Curves](#621-fan-curves)
  - [6.22. BIOS Profiles and Backups](#622-bios-profiles-and-backups)
- [7. Configure USB Port Layout](#7-configure-usb-port-layout)
  - [7.1. Assess Accessible USB Ports](#71-assess-accessible-usb-ports)
  - [7.2. Layout Planning](#72-layout-planning)
  - [7.3. Plugging In Devices](#73-plugging-in-devices)
- [8. Configure Peripherals](#8-configure-peripherals)
  - [8.1. Cleaning](#81-cleaning)
  - [8.2. Configure Onboard Memory Profiles](#82-configure-onboard-memory-profiles)
  - [8.3. Disable RGB Lighting Effects](#83-disable-rgb-lighting-effects)
  - [8.4. DPI](#84-dpi)
  - [8.5. Report Rate](#85-report-rate)
  - [8.6. Polling Stability Analysis](#86-polling-stability-analysis)
  - [8.7. Monitor](#87-monitor)
- [9. Stability, Hardware Clocking and Thermal Performance](#9-stability-hardware-clocking-and-thermal-performance)
  - [9.1. Temporary Operating System](#91-temporary-operating-system)
  - [9.2. General Information](#92-general-information)
  - [9.3. Error Correction](#93-error-correction)
  - [9.4. Thermal Management](#94-thermal-management)
  - [9.5. Load-line Calibration](#95-load-line-calibration)
  - [9.6. GPU](#96-gpu)
  - [9.7. RAM/CPU](#97-ramcpu)
  - [9.8. Stress-Testing Tools](#98-stress-testing-tools)
- [10. Install Windows](#10-install-windows)
  - [10.1. Configure Storage Partitions](#101-configure-storage-partitions)
  - [10.2. What Version of Windows Should You Use?](#102-what-version-of-windows-should-you-use)
  - [10.3. Download and Prepare a Stock Windows ISO](#103-download-and-prepare-a-stock-windows-iso)
  - [10.4. ISO Sources](#104-iso-sources)
  - [10.5. ISO Preparation (required)](#105-iso-preparation-required)
  - [10.6. Fetching Required Files](#106-fetching-required-files)
  - [10.7. Boot Into the ISO](#107-boot-into-the-iso)
- [11. Configure Windows](#11-configure-windows)
  - [11.1 OOBE Setup](#111-oobe-setup)
  - [11.2. Unrestricted PowerShell Execution Policy](#112-unrestricted-powershell-execution-policy)
  - [11.3. Import ``bin`` Folder](#113-import-bin-folder)
  - [11.4. Merge the Registry Options](#114-merge-the-registry-options)
    - [11.4.1. Registry Options Documentation (Required Reading)](#1141-registry-options-documentation-required-reading)
    - [11.4.2. Apply Options](#1142-apply-options)
  - [11.5. Install Drivers](#115-install-drivers)
  - [11.6. Privacy Options (Windows 8+)](#116-privacy-options-windows-8)
  - [11.7. Time, Language and Region](#117-time-language-and-region)
  - [11.8. Configure a Web Browser](#118-configure-a-web-browser)
  - [11.9. 11.8. Scheduled Tasks](#119-scheduled-tasks)
  - [11.10. Activate Windows](#1110-activate-windows)
  - [11.11. Miscellaneous](#1111-miscellaneous)
  - [11.12. Disable Superfetch and Prefetch](#1112-disable-superfetch-and-prefetch)
  - [11.13. Operating System and Partition Name](#1113-operating-system-and-partition-name)
  - [11.14. Show Tray Icons](#1114-show-tray-icons)
  - [11.15. Disable Hibernation](#1115-disable-hibernation)
  - [11.16. Install Runtimes](#1116-install-runtimes)
  - [11.17. Handle Bloatware](#1117-handle-bloatware)
  - [11.18. Optional Features](#1118-optional-features)
    - [11.18.1. NET 3.5](#11181-net-35)
  - [11.19. Install 7-Zip](#1119-install-7-zip)
  - [11.20. Configure the Graphics Driver](#1120-configure-the-graphics-driver)
  - [11.21. Configure MSI Afterburner](#1121-configure-msi-afterburner)
  - [11.22. Display Resolutions and Scaling Modes](#1122-display-resolutions-and-scaling-modes)
  - [11.23. Install Open-Shell (Windows 8+)](#1123-install-open-shell-windows-8)
  - [11.24. Spectre, Meltdown and CPU Microcode](#1124-spectre-meltdown-and-cpu-microcode)
  - [11.25. Configure Power Options](#1125-configure-power-options)
  - [11.26. Replace Task Manager with Process Explorer](#1126-replace-task-manager-with-process-explorer)
  - [11.27. Disable Process Mitigations (Windows 10 1709+)](#1127-disable-process-mitigations-windows-10-1709)
  - [11.28. Configure Memory Management Settings (Windows 8+)](#1128-configure-memory-management-settings-windows-8)
  - [11.29. Configure the Network Adapter](#1129-configure-the-network-adapter)
  - [11.30. Configure Audio Devices](#1130-configure-audio-devices)
  - [11.31. Configure Device Manager](#1131-configure-device-manager)
  - [11.32. Disable Driver Power-Saving](#1132-disable-driver-power-saving)
  - [11.33. Configure Event Trace Sessions (ETS)](#1133-configure-event-trace-sessions-ets)
  - [11.34. Optimize the File System](#1134-optimize-the-file-system)
  - [11.35. Message Signaled Interrupts](#1135-message-signaled-interrupts)
  - [11.36. XHCI Interrupt Moderation (IMOD)](#1136-xhci-interrupt-moderation-imod)
  - [11.37. Configure Control Panel](#1137-configure-control-panel)
  - [11.38. Configuring Applications](#1138-configuring-applications)
    - [11.38.1 NVIDIA Reflex](#11381-nvidia-reflex)
    - [11.38.2 Framerate Limit](#11382-framerate-limit)
    - [11.38.3 Presentation Mode](#11383-presentation-mode)
    - [11.38.4. Game Mode](#11384-game-mode)
    - [11.38.5. Media Player](#11385-media-player)
    - [11.38.6. QoS Policies](#11386-qos-policies)
  - [11.39. Kernel-Mode Scheduling (Interrupts, DPCs and more)](#1139-kernel-mode-scheduling-interrupts-dpcs-and-more)
    - [11.39.1.  GPU and DirectX Graphics Kernel](#11391--gpu-and-directx-graphics-kernel)
    - [11.39.2. XHCI and Audio Controller](#11392-xhci-and-audio-controller)
    - [11.39.3. Network Interface Card](#11393-network-interface-card)
  - [11.40. User-Mode Scheduling (Processes, Threads)](#1140-user-mode-scheduling-processes-threads)
    - [11.40.1. Starting a Process with a Specified Affinity Mask](#11401-starting-a-process-with-a-specified-affinity-mask)
    - [11.40.2. Specifying an Affinity Mask for Running Processes](#11402-specifying-an-affinity-mask-for-running-processes)
  - [11.41. Reserved CPU Sets (Windows 10+)](#1141-reserved-cpu-sets-windows-10)
    - [11.41.1. Use Cases](#11411-use-cases)
  - [11.42. Analyze Event Viewer](#1142-analyze-event-viewer)
  - [11.43. Virtualization Based Security (VBS)](#1143-virtualization-based-security-vbs)
  - [11.44. CPU Idle States](#1144-cpu-idle-states)
    - [11.44.1. Enable Idle States (default)](#11441-enable-idle-states-default)
    - [11.44.2. Disable Idle States](#11442-disable-idle-states)
  - [11.45. Cleanup and Maintenance](#1145-cleanup-and-maintenance)

---

# 2. Introduction

The primary objective of this resource is to utilize an evidence-oriented approach to explore practices for tuning Windows-based systems for a variety of use cases, covering hardware, operating system (OS), and software configurations. The material is designed to accommodate a broad audience including advanced users, addressing various goals such as enhancing security, protecting privacy however, it generally favors and caters for gaining a competitive edge in games and executing real-time tasks. There is a strong emphasis on encouraging users to make the changes themselves, with little to no use of scripts to ensure transparency and prevent unintended modifications to the reader's system.

The reader is expected to follow the sections in sequential order as subsequent steps are contingent upon the completion of preceding steps. Therefore, each section is numbered.

## 2.1. Other Resources

- [BoringBoredom/PC-Optimization-Hub](https://github.com/BoringBoredom/PC-Optimization-Hub)
- [Calypto's Latency Guide](https://calypto.us)
- [djdallmann/GamingPCSetup](https://github.com/djdallmann/GamingPCSetup)
- Windows Internals, Part 1: System Architecture, Processes, Threads, Memory Management, and More
- Windows Internals, Part 2

---

# 3. Benchmarking

Benchmarking is the process of evaluating the quality or characteristic of a given change. In the context of this resource, it typically refers to measuring performance scaling after making certain changes to your system. It is important to learn and understand what is involved in the benchmarking process as you will need to carry out your own experiments to assist in decision-making such as identifying whether a certain change results in a performance regression or what settings to use in-game. For given changes, ask yourself questions such as "*What am I trying to achieve?*", "*What is my goal?*", "*What am I trying to improve with this change?*", "*What is this change supposed to affect?*".

- [FrameView](https://www.nvidia.com/en-gb/geforce/technologies/frameview) - [PC Latency](https://images.nvidia.com/content/images/article/system-latency-optimization-guide/nvidia-latency-optimization-guide-pc-latency.png) in games that support [PC Latency Stats](https://www.nvidia.com/en-gb/geforce/technologies/reflex/supported-products) and frame pacing
- [PresentMon](https://boringboredom.github.io/Frame-Time-Analysis) - Various metrics such as frame pacing and [GPU Busy](https://www.intel.com/content/www/us/en/docs/gpa/user-guide/2022-4/gpu-metrics.html). See a full list [here](https://github.com/GameTechDev/PresentMon/blob/main/README-CaptureApplication.md#metric-definitions)
- [Windows Performance Toolkit](https://learn.microsoft.com/en-us/windows-hardware/test/wpt) - Advanced performance analysis library for Windows. Measure ISR/DPC execution times with xperf
- Mouse Tester - Polling interval, X/Y counts and more plots against time
- [NVIDIA Reflex Analyzer](https://www.nvidia.com/en-gb/geforce/news/reflex-latency-analyzer-360hz-g-sync-monitors) - End-to-end latency
- [Frame-Time-Analysis](https://boringboredom.github.io/Frame-Time-Analysis) - Analyze CSV data logged by the programs mentioned above including 1%, 0.1% lows metrics
- [Latency Grapher](https://boringboredom.github.io/tools/latencygrapher) - Analyze latency results from RLA, FrameView and PresentMon

---

# 4. Physical Setup

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

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

- Avoid daisy-chaining power cables anywhere in your setup

  - See [Installation Remark for High Power Consumption Graphics Cards | Seasonic](https://knowledge.seasonic.com/article/8-installation-remark-for-high-power-consumption-graphics-cards)

- Favor shielded cables and avoid unnecessarily long ones as they offer more protection against interference ([1](https://precmfgco.com/blog/shielded-vs-unshielded-cables))

- Ensure that there is a moderate amount of space between cables to reduce the risk of [coupling](https://en.wikipedia.org/wiki/Coupling_(electronics))

- Clean dust from components and heat sinks as they have the potential to cause short circuits and reduce airflow ([1](https://www.armagard.co.uk/articles/dust-computer-killer.html)). Be careful in regard to voltage feedback to the motherboard when dusting case fans

- Clean the contact pins and connectors of components. Use compressed air to remove dust from slots before installing components such as PCIe, NVMe, RAM and more

- Insert the display cable into the discrete GPU if present instead of the motherboard

- Minimize GPU sag with an anti-sag bracket or similar to prevent damage to the PCIe contacts and the slot itself

- Multi-monitor setups have the potential to introduce processing overhead ([1](https://www.youtube.com/watch?v=5wBxYQdN96s))

---

# 5. Cooling

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

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

- Use an M.2/NVMe heat sink and optionally mount a fan over it

---

# 6. BIOS/UEFI

As a general rule of thumb, ensure that the settings you are changing results in positive performance scaling and make note of them for future reference/backtracking to resolve potential issues. I would recommend resetting settings to factory defaults to work with a clean slate in case anything was misconfigured initially.

## 6.1. Partition Style

If you aren't already using the partition style you would like to be using, you should switch now because some settings listed in this section depend on the partition style (search for *"GPT/UEFI"* in this section). GPT/UEFI is recommended for most systems as it offers the most compatibility ([1](https://www.diskpart.com/gpt-mbr/mbr-vs-gpt-1004.html)). The current partition style can be determined by typing ``msinfo32`` in ``Win+R``. The recommended method to convert the partition style is to wipe and convert the disk using diskpart within Windows setup ([1](https://learn.microsoft.com/en-us/windows-server/storage/disk-management/change-an-mbr-disk-into-a-gpt-disk)).

- See [How To Convert MBR to GPT During Windows 10/8/7 Installation | MDTechVideos](https://www.youtube.com/watch?v=f81qKAJUdKc)

## 6.2. Consider Windows Version

Consider what Windows version you will be using because some settings listed in this section depend on the Windows version being used (search for *"Windows"* in this section). Read the [What Version of Windows Should You Use?](#102-what-version-of-windows-should-you-use) section to help decide what to use.

## 6.3. BIOS Recovery Methods

Modifying BIOS is never without risks. Explore methods to flash a stock BIOS such as USB flashback or a [CH341A](https://www.techinferno.com/index.php?/topic/12230-some-guide-how-to-use-spi-programmer-ch341a) programmer if [clearing CMOS](https://www.intel.co.uk/content/www/uk/en/support/articles/000025368/processors.html) does not restore everything to its original state.

## 6.4. BIOS Updates

Check for BIOS updates and positive changes in the change logs (e.g. increased memory stability). Beware of problems brought up in reviews and forums regarding specific BIOS versions if applicable.

## 6.5. BIOS Microcode

> [!WARNING]
> 🔒 Upgrading or downgrading microcode may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

On much older platforms and CPUs, BIOS-level Spectre, Meltdown and other CPU microcode patches had the ability to drastically influence performance which isn't so much the case with modern systems nowadays. [CPU-Z's](https://www.cpuid.com/softwares/cpu-z.html) validation feature exposes the microcode version and it was possible to manipulate microcode and their versions within the BIOS using tools such as [MMTool](https://www.ami.com/blog/2017/10/30/what-is-mmtool). Nonetheless, this is not necessarily required to be changed on modern platforms and is here as an informative note.

## 6.6. Accessing Hidden Options

Motherboard vendors hide and lock a lot of settings so that they aren't visible to a regular user. For clarification, unlocking BIOS corresponds to making hidden settings visible and accessible. The easiest approach to take is to change the access levels within the BIOS using [UEFI-Editor](https://github.com/BoringBoredom/UEFI-Editor#usage-guide) then flash it which will result in hidden options available in the UEFI. An alternative approach is to configure what is already accessible in UEFI then access hidden options by reading and writing to NVRAM using [GRUB](https://github.com/BoringBoredom/UEFI-Editor#how-to-change-hidden-settings-without-flashing-a-modded-bios) or [SCEWIN](https://github.com/ab3lkaizen/SCEHUB).

## 6.7. Disable Unnecessary Devices

Generally, follow the rule of "If you're not using it, disable it". It is preferable to physically disconnect components if possible, but this typically includes NICs, WLAN, Bluetooth, High Definition Audio (if you are not utilizing motherboard audio) controllers, integrated graphics, SATA, RAM slots, onboard devices visible in [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html) (e.g. LED controllers, IR receivers) and more. Keep in mind that some motherboards have the High Definition Audio controller linked to the USB controller ([1](https://www.igorslab.de/en/the-old-alc4080-on-the-new-intel-boards-demystified-and-the-differences-from-alc1220-insider)) so don't get confused if this is encountered in the USB device tree.

## 6.8. Resizable Bar

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Resizable Bar requires the GPT/UEFI BIOS mode and `Above 4G Decoding` to be enabled. For unsupported motherboards, consider viewing [ReBarUEFI](https://github.com/xCuri0/ReBarUEFI)/[NvStrapsReBar](https://github.com/terminatorul/NvStrapsReBar). To verify that Resizable Bar is enabled, check the status with [GPU-Z](https://www.techpowerup.com/gpuz).

## 6.9. Hyper-Threading/Simultaneous Multithreading

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

If you have enough CPUs for your application then consider disabling [Hyper-Threading (HT)/Simultaneous Multithreading (SMT)](https://en.wikipedia.org/wiki/Hyper-threading). This feature is beneficial for highly threaded operations such as encoding, compiling and rendering however using multiple execution threads per CPU increases contention on processor resources and is a potential source of system latency and jitter ([1](https://www.intel.com/content/www/us/en/developer/articles/technical/optimizing-computer-applications-for-latency-part-1-configuring-the-hardware.html)). Disabling HT/SMT has the additional benefit of increased overclocking potential due to lower temperatures in which, a similar concept can be applied to Intel's E-Cores (efficiency cores) however, both can affect performance positively or negatively in some games hence, I would recommend benchmarking these options thoroughly and not blindly disabling them.

## 6.10. Power States

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

To be completed.

## 6.11. Virtualization/SVM Mode

Disable [Virtualization/SVM Mode](https://en.wikipedia.org/wiki/Desktop_virtualization) and [Intel VT-d/AMD-Vi](https://en.wikipedia.org/wiki/X86_virtualization#I/O_MMU_virtualization_(AMD-Vi_and_Intel_VT-d)) if applicable as they can cause a difference in latency for memory access ([1](https://www.amd.com/system/files/TechDocs/56263-EPYC-performance-tuning-app-note.pdf)). Virtualization also has the potential to affect BCLK ([1](https://linustechtips.com/topic/1479168-issue-enabling-svm-virtualization-causes-bclk-to-fluctuate-a-lot)). The virtualization status can be verified using Task Manager's CPU section.

## 6.12. Power-Saving

Power-saving has no place on a machine executing real-time tasks. These features can be named differently, including but not limited to [ASPM (Active State Power Management)](https://en.wikipedia.org/wiki/Active_State_Power_Management) (e.g. search for *L0*, *L1*), [ALPM (Aggressive Link Power Management)](https://en.wikipedia.org/wiki/Aggressive_Link_Power_Management), DRAM Power Down Mode, Power/Clock Gating and more. You can also look out for options named *power management* or *power saving*. Search the internet if you are unsure whether a given setting is power-saving related.

## 6.13. Trusted Platform Module (TPM)

> [!WARNING]
> 🔒 Disabling TPM may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Disable Trusted Platform Module as it may cause the system to enter System Management Mode (SMM) via System Management Interrupts (SMIs) ([1](https://youtu.be/X72LgcMpM9k?si=A5Kl5NmU5f1WzZP4&t=2060)) which are high priority unmaskable hardware interrupts which cause the CPU to immediately suspend all other activities, including the operating system ([1](https://wiki.linuxfoundation.org/realtime/documentation/howto/debugging/smi-latency/smi)). On Windows 11, a minority of anticheats (Vanguard, FACEIT) require it to be enabled and its status can be verified by typing ``tpm.msc`` in ``Win+R``.

## 6.14. Compatibility Support Module (CSM)

MBR/Legacy requires Compatibility Support Module to be enabled and typically, only the storage and PCIe OpROMs are required, but you can enable all of them if you are unsure. Disable CSM if you are using GPT/UEFI with the exception being Windows 7 GPT/UEFI as it requires CSM and OpROMs unless you are using [uefiseven](https://github.com/manatails/uefiseven).

## 6.15. Secure Boot

> [!WARNING]
> 🔒 Disabling Secure Boot may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

On Windows 11, a minority of anticheats (Vanguard, FACEIT, THE FINALS) require Secure Boot to be enabled. If something fails due to Secure Boot being enabled such as bootable tools, I recommended temporarily disabling it rather than resorting to alternative solutions such as enrolling keys as they can lead to issues. If Secure Boot is not required, it can be disabled to avoid various issues. Its status can be verified by typing ``msinfo32`` in ``Win+R``.

## 6.16. Fast Startup, Standby and Hibernate

This boils down to personal preference, perceptions and experiences however, some individuals prefer not to utilize features such as Fast Startup, standby and hibernation, as they can lead to unexpected issues ([explanation](https://www.youtube.com/watch?v=OBGxt8zhbRk)), while preferring to perform clean system boots instead of saving and restoring kernel and software state thus limiting the system power states to S0 (working state) and S5 (soft off). Learn about system power states and their meaning [here](https://learn.microsoft.com/en-us/windows/win32/power/system-power-states) and [here](https://www.sciencedirect.com/topics/computer-science/sleeping-state). These options in BIOS are often named Fast Startup, Suspend to RAM, S-States (search for *S1*, *S2*, *S3*, *S4*, *S5*), standby or similar options. S-State status can be verified with ``powercfg /a`` in CMD.

Windows also has a toggle that disables Fast Startup, hibernation and removes ``C:\hiberfil.sys``:

```bat
powercfg /h off
```

## 6.17. Spread Spectrum

Disable Spread Spectrum and ensure BCLK frequency is close to the desired value as possible (e.g. 100.00MHz not 99.97MHz) in [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html) however, this highly dependent on the system and motherboard.

## 6.18. Legacy USB Support

Disable Legacy USB Support as it may cause the system to enter System Management Mode (SMM) via System Management Interrupts (SMIs) ([1](https://patents.google.com/patent/US6067589), [2](https://www.kernel.org/doc/Documentation/x86/usb-legacy-support.txt)) which are high priority unmaskable hardware interrupts which cause the CPU to immediately suspend all other activities, including the operating system ([1](https://wiki.linuxfoundation.org/realtime/documentation/howto/debugging/smi-latency/smi)). You may need to turn this on to install a new operating system, access BIOS or USB devices in some cases.

## 6.19. Disable Software Installation Options

If there are options relating to software installation (e.g. ASUS Armoury Crate), then disable them. These types of software are typically in-line with other bloatware which can safely be avoided and are present in various BIOSes ([ASUS](https://www.asus.com/support/faq/1043788), [Gigabyte](https://old.reddit.com/r/gigabyte/comments/106d9ns/gigabyte_control_center_prompt_to_install_every/ja0gc6l), [MSI](https://old.reddit.com/r/MSI_Gaming/comments/14s7so7/how_to_disable_autoinstall_of_msi_center/l6zoigh), [ASRock](https://old.reddit.com/r/ASRock/comments/1bxf8jt/asrock_auto_driver_install_app/kyc904r)).

## 6.20. Configure PCI Link Speed for Devices

Set PCIe link speed to the maximum supported such as ``Gen 4.0``. This may be represented as gigatransfers per second (GT/s) ([1](https://en.wikipedia.org/wiki/PCI_Express#Comparison_table)). This helps with alleviating unexpected behavior and issues.

## 6.21. Fan Curves

To maximize cooling potential, configure fan curves ([example](https://imgur.com/a/2UDYXp0)) or set a static, high, noise-acceptable RPM. Set your AIO pump speed to full if applicable.

## 6.22. BIOS Profiles and Backups

Backup BIOS by saving the current settings to a profile or export one to local storage as clearing CMOS will wipe all settings if you need to do so (e.g. while overclocking).

In my experience on various motherboards, loading a saved profile fails to restore certain settings after clearing CMOS. I would recommend dumping NVRAM using a tool such as [SCEWIN](https://github.com/ab3lkaizen/SCEHUB) so that when you restore a profile, dump NVRAM again then compare it to the previous/original export to see whether anything failed to restore by using a text comparison tool such as the [Notepad++ Compare plugin](https://sourceforge.net/projects/npp-compare) or [Visual Studio Code](https://code.visualstudio.com/download).

---

# 7. Configure USB Port Layout

## 7.1. Assess Accessible USB Ports

Firstly, familiarize yourself with which USB ports correspond to given USB controllers as some ports shown in [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html) may not be physically accessible. I recommended plugging a device into every accessible port on your system such as the ones on the motherboard I/O and front panels, then take a note of which controller and port each physical port corresponds to in USB Device Tree Viewer

## 7.2. Layout Planning

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Secondly, plan and decide which USB controllers you would like to plug devices into but don't plug them in yet. As for which USB controllers should be used, that is up to you. If you have more than one USB controller, you can isolate devices such as your mouse, keyboard and audio devices onto another USB controller as they have the potential to interfere with polling consistency ([1](https://forums.blurbusters.com/viewtopic.php?f=10&t=7618#p58449)). More USB controllers may be made available by using PCIe expansion cards or external USB 2.0 and 3.0 headers on your motherboard. Always verify with [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html). Ryzen systems have a USB controller that is directly connected to the CPU ([1](https://hexus.net/tech/features/mainboard/131789-amd-ryzen-3000-supporting-x570-chipset-examined)) which can be identified under the PCIe Bus category in [HWiNFO](https://www.hwinfo.com). It is usually the USB controller that is connected to an ``Internal PCIe Bridge to bus`` which is also labelled with the CPU architecture ([example](/assets/images/ryzen-cpu-usb-controller.png)).

## 7.3. Plugging In Devices

Lastly, plug the devices into the ports and USB controllers that you have decided to use. In any case, consider populating ones that are closest to the root of the USB controller's hub tree first. Additionally, I would also recommend avoiding internal hubs ([example](/assets/images/usb-hub-internal-headers.png)).

---

# 8. Configure Peripherals

## 8.1. Cleaning

Carefully use an [air dust blower](https://www.amazon.com/s?k=air+dust+blower) to remove dirt and debris from the mouse sensor lens without damage.

## 8.2. Configure Onboard Memory Profiles

Most modern peripherals support onboard memory profiles such as mice and keyboards. Configure them before configuring the OS as you will not be required to install the bloatware such as Razer Synapse to change the settings later. Details for separating bloat-free and bloated environments using a dual-boot will be discussed in later steps. Alternatively, limit the bloated software to a bootable Windows USB ([Windows To Go](https://www.youtube.com/watch?v=w34x1kBZN6c)).

## 8.3. Disable RGB Lighting Effects

USB 2/3 are limited to 0.5A/0.9A respectively ([1](https://en.wikipedia.org/wiki/USB)) and RGB requires unnecessary power. Turn off lighting effects or strip the LED from the peripheral as running an RGB effect/animation can take a great toll on the MCU and will delay other processes ([1](https://wooting.io/post/what-influences-keyboard-speed), [2](https://www.techpowerup.com/review/endgame-gear-xm1-rgb/5.html#:~:text=tracking%20quality%20takes%20a%20hit%20as%20soon%20as%20RGB%20is%20enabled), [3](https://www.techpowerup.com/review/roccat-kone-pro-air/5.html#:~:text=after%20having%20disabled%20all%20RGB%20lighting,%20these%20outliers%20disappeared%20entirely)).

## 8.4. DPI

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Higher sensor DPI reduces latency and helps in saturating polls with motion data ([1](https://www.youtube.com/watch?v=6AoRfv9W110), [2](https://www.youtube.com/watch?v=mwf_F2VboFQ&t=458s), [3](https://www.youtube.com/watch?v=imYBTj2RXFs&t=275s)). Avoid jitter reduction and [sensor smoothing](https://old.reddit.com/r/MouseReview/comments/5haxn4/sensor_smoothing) kicking in with higher DPI values. If your game uses raw input, you can [reduce the pointer speed](https://boringboredom.github.io/tools/winsenscalculator) in Windows to offset the sensitivity from higher DPI. Otherwise, leave the slider at the default position as input will be negatively affected due to scaling. One way to determine whether a given application is using raw input is to spy on the raw input API calls with [API Monitor](http://www.rohitab.com/apimonitor) or check whether the ``enhance pointer precision`` option has any effect in-game. If you are still unsure or have doubts, leave the slider at the default position.

## 8.5. Report Rate

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Higher polling rates reduce jitter and latency ([1](https://www.youtube.com/watch?app=desktop&v=djCLZ6qEVuA), [2](https://www.youtube.com/watch?v=mwf_F2VboFQ&t=458s), [3](https://www.youtube.com/watch?v=mwf_F2VboFQ&t=618s)). Higher polling rates may negatively impact performance depending on your hardware and general configuration so adjust accordingly.

## 8.6. Polling Stability Analysis

Use Mouse Tester to check whether each poll contains data. As an example, if the interval is spiking to 2ms (500Hz) or higher from 1ms (1kHz), this is problematic and may be due to several variables such as the device itself (e.g. sensor fault), cable, power issues, hardware, operating system and more. You may need to lower or disable USB interrupt moderation using the [XHCI-IMOD-Interval.ps1](/bin/XHCI-IMOD-Interval.ps1) script if there are multiple devices generating interrupts on the same USB controller and/or the mouse interrupts are being generated at a rate greater than or equal to the default IMOD interval during the benchmark resulting in IMOD kicking in.

## 8.7. Monitor

Optionally reset your monitor to factory settings and reconfigure it in case anything was misconfigured initially. Overdrive/AMA reduces latency ([1](https://twitter.com/CaIypto/status/1464236780190851078)) however, it comes with the penalty of additional overshoot. Additionally, you can attempt to calibrate it. Optionally overclock your display with [Custom Resolution Utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) and test for [frame skipping](https://www.testufo.com/frameskipping). Aim for an `actual` integer refresh rate such as 60.00/240.00, not 59.94/239.76.

- See [Can You Calibrate a Monitor WITHOUT a Colorimeter? | techless](https://www.youtube.com/watch?v=avJTz1JhkR4)

---

# 9. Stability, Hardware Clocking and Thermal Performance

Ensure that all of your hardware is stable before configuring a new operating system as unstable hardware can lead to crashes, data corruption, worse performance or indirectly irreversible damage to hardware. The effectiveness of testing for instability varies between tools which is why it is important to use a range of them for a sufficient amount of time (a non-exhaustive list of recommended tools is listed below).

## 9.1. Temporary Operating System

I would highly recommend configuring a temporary dual-boot with a fresh installation of Windows or a bootable Windows USB ([Windows To Go](https://www.youtube.com/watch?v=w34x1kBZN6c)) to avoid corrupting your main operating system while stress-testing and overclocking. In terms of memory stress-testing, this also allows the stress-test to use more RAM as it isn't being hogged by potential bloatware on your current installation. Safe mode can also serve as a minimal testing environment but certain software may not work.

## 9.2. General Information

- Verify and validate changes within software to avoid unexpected results and behavior (e.g. frequency, voltages, timings)

- Save a BIOS profile before each change when overclocking such as changing CPU/RAM frequency and RAM timings so that you don't lose progress if you need to clear CMOS. Refer to the [BIOS Profiles and Backups](#622-bios-profiles-and-backups) section regarding restoring settings properly

- When overclocking, you may be required to raise various power limits if the default limits are exceeded

- Use [HWiNFO](https://www.hwinfo.com) to monitor system sensors. A higher polling interval can help to identify sudden spikes but not transients on a microsecond scale as an example. Avoid running while benchmarking as it has the potential to reduce the reliability of results

- A single error or crash is one too many. Monitor WHEAs with [HWiNFO](https://www.hwinfo.com)'s error count or configure an Event Viewer filter

- Monitor voltages where applicable due to potential overvolting

- There are countless factors that contribute to stability such as temperature, power delivery, quality of hardware in general, silicon lottery and more

## 9.3. Error Correction

Overclocking does not necessarily mean that the system will perform better due to factors such as error correction where applicable. You should verify whether whatever you are changing scales positively by adopting a systematic benchmarking methodology.

## 9.4. Thermal Management

Avoid thermal throttling at all costs. As a reminder, ambient temperature will generally increase during the summer. Deliberately underclock if your cooler is inadequate. A thermally stable component with an overall lower frequency is preferable compared to thermal throttling at a higher frequency/voltage. To apply additional thermal stress when tuning any component (e.g. CPU, RAM, GPU), consider turning off case, RAM fans or reducing RPM along with generating extra heat (e.g. GPU load, room heaters) while stress-testing.

- See [RAM Overclock Stability and Heat Management | buildzoid](https://www.youtube.com/watch?v=iCD0ih4qzHw)

## 9.5. Load-line Calibration

This is not a recommendation of what LLC mode to use and is instead, here for informative purposes.

- See [VRM Load-Line Visualized | ElmorLabs](https://elmorlabs.com/2019-09-05/vrm-load-line-visualized)
- See [Vdroop setting and it’s impact on CPU operation | xDevs](https://xdevs.com/guide/e399ocg/#vdroop)
- See [Why Vdroop is good for overclocking and taking a look at Gigabyte's Override Vcore mode | buildzoid](https://www.youtube.com/watch?v=zqvNkh4TVw8)

## 9.6. GPU

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

When overclocking the GPU, you may be required to flash a BIOS with a higher power limit or raise them.

- On NVIDIA systems, ensure to disable ``CUDA - Force P2 State`` with [NVIDIA Profile Inspector](https://github.com/Orbmu2k/nvidiaProfileInspector) to prevent memory downclocking while stress-testing
- See [A Slightly Better Way To Overclock and Tweak Your Nvidia GPU | Cancerogeno](https://docs.google.com/document/d/14ma-_Os3rNzio85yBemD-YSpF_1z75mZJz1UdzmW8GE/edit)
- See [LunarPSD/NvidiaOverclocking](https://github.com/LunarPSD/NvidiaOverclocking/blob/main/Nvidia%20Overclocking.md)

## 9.7. RAM/CPU

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

- Ensure that your CPU is able to boost correctly before starting in case you have disabled options such as SpeedStep and Speed Shift which can prevent the processor from exceeding its base frequency

- Configure RAM frequency and timings manually for a significant performance improvement ([1](https://kingfaris.co.uk/blog/intel-ram-oc-impact)). XMP does not tune many timings nor does it guarantee stability

  - See [Eden’s DDR4 guide](https://web.archive.org/web/20231211232729/https://cdn.discordapp.com/attachments/328891236918493184/1172922515962724444/DDR4_Guide_V1.2.1.pdf)
  - See [KoTbelowall/INTEL-DDR4-RAM-OC-GUIDE-by-KoT](https://github.com/KoTbelowall/INTEL-DDR4-RAM-OC-GUIDE-by-KoT)
  - See [integralfx/MemTestHelper](https://github.com/integralfx/MemTestHelper/blob/oc-guide/DDR4%20OC%20Guide.md)

- Configure static all-core frequencies and voltages for the CPU. Variations in hardware clocks can introduce jitter due to the process of frequency transitions. [Precision Boost Overdrive](https://www.amd.com/en/support/kb/faq/cpu-pb2) for Ryzen CPUs is an alternative option to a static frequency and voltages and is often recommended

- The previous two bullet points affect each other in terms of stability which means that your RAM overclock may become unstable after tuning the CPU, so run RAM stress-tests again and adjust your CPU settings if required

## 9.8. Stress-Testing Tools

- StresKit (bootable)

- Linpack

  - StresKit's Linpack
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

---

# 10. Install Windows

## 10.1. Configure Storage Partitions

Set up a [multi-boot](https://en.wikipedia.org/wiki/Multi-booting) system to maintain separate environments for work/bloatware and gaming, ensuring the latter one remains free of bloatware. This allows you to keep the gaming partition clean and free of unnecessary software, as discussed in earlier sections. By doing so, you avoid installing bloatware on the same partition where you use real-time applications without sacrificing usability. To achieve this, shrink a volume in Disk Management ([instructions](https://docs.microsoft.com/en-us/windows-server/storage/disk-management/shrink-a-basic-volume)) to create unallocated space for installing the new operating system.

## 10.2. What Version of Windows Should You Use?

- Earlier versions of Windows lack anticheat support (due to lack of security updates from end-of-life OSes), driver support (commonly GPU, NIC) and application support in general, so some users are forced to use newer builds. See the table below of the minimum version required to install drivers for given GPUs

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

## 10.3. Download and Prepare a Stock Windows ISO

In order to install Windows, an installation media must be created using an ISO file. Upon downloading ISOs, ensure to cross-check the hashes for the file with official sources to verify that it is genuine and not corrupted. Use the command ``certutil -hashfile <file>`` in CMD to obtain the hashes of the file.

Ensure to download an ISO that contains an edition with group policy support as several policies are configured in later steps. Sometimes, you can get ISOs with specific editions missing so be careful. Below is a list of recommended editions.

- Client editions: Professional
- Server editions: Standard (Desktop Experience)

## 10.4. ISO Sources

- [os.click](https://os.click)
- [New Download Links](https://docs.google.com/spreadsheets/d/1zTF5uRJKfZ3ziLxAZHh47kF85ja34_OFB5C5bVSPumk)
- [Adguard File List](https://files.rg-adguard.net)
- [Microsoft Software Download Listing](https://massgrave.dev/msdl)
- [Fido](https://github.com/pbatard/Fido)
- [UUP dump](https://uupdump.net)

## 10.5. ISO Preparation (Required)

<details>
<summary>Windows 7</summary>

If you are configuring Windows 7, I recommend using the ``en_windows_7_professional_with_sp1_x64_dvd_u_676939.iso`` ISO ([Adguard hashes](https://files.rg-adguard.net/file/11ad6502-c2aa-261c-8c3f-c81477b21dd2?lang=en-us)). Aditionally, you won't be able to boot into the ISO on modern hardware without integrating necessary drivers and updates which can be accomplished using tools such as [NTLite](https://www.ntlite.com) ([instructions](https://winraid.level1techs.com/t/guide-integration-of-drivers-into-a-win7-11-image/30793)). Typically, only [NVMe](https://winraid.level1techs.com/t/recommended-ahci-raid-and-nvme-drivers/28310) and [USB](https://winraid.level1techs.com/t/usb-3-0-3-1-drivers-original-and-modded/30871) drivers are required to be integrated into the ISO to physically be able to boot into it. Ensure to integrate the drivers in Windows Setup as well otherwise you may have storage detection and unusable USB input, unless you plan on installing the ISO with DISM as described in the [Boot Into the ISO](#107-boot-into-the-iso) section because it completely bypasses traditional Windows Setup and the ``boot.wim``. To find drivers that are compatible with your device, search for ones that support your device's HWID ([example](/assets/images/device-hwid-example.png)). If you are unable to find a USB driver for your HWID, try to integrate the [generic USB driver](https://forums.mydigitallife.net/threads/usb-3-xhci-driver-stack-for-windows-7.81934) and the ``KB2864202`` update. Below is a table of updates that I recommend integrating into the ISO.

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

If you are having trouble with Windows Setup when installing with a USB storage device despite integrating drivers and updates into the ``boot.wim``, you can use modern Windows Setup to install your Windows 7 ISO by placing the Windows 7 ``intall.wim`` in the ``sources`` folder of a Windows 10 ISO's ``sources`` folder. Ensure that the language of the ISOs match. This method of installing Windows 7 has alleviated issues for other individuals as modern Windows Setup is equipped with the required components to run on modern hardware and offers greater compatibility.
</details>

<details>
<summary>Windows 8.1</summary>

If you are configuring Windows 8.1, I recommend using the ``en_windows_8_1_x64_dvd_2707217.iso`` ISO ([Adguard hashes](https://files.rg-adguard.net/file/406e60db-4275-7bf8-616f-56e88d9e0a4a?lang=en-us)). Additionally, the table below contains a list of updates that I recommend integrating into the ISO which can be accomplished using tools such as [NTLite](https://www.ntlite.com) ([instructions](https://winraid.level1techs.com/t/guide-integration-of-drivers-into-a-win7-11-image/30793)).

|Knowledge Base (KB) ID|Notes|
|---|---|
|KB2919442|Servicing Stack Update|
|KB2999226|Universal C Runtime|
|KB2919355|Cumulative Update|
|KB3191566|WMF 5.1 (<https://www.microsoft.com/en-us/download/details.aspx?id=54616>)|
</details>

<details>
<summary>Windows 10</summary>

No additional steps are required for Windows 10+ versions. [NTLite](https://www.ntlite.com) ([instructions](https://winraid.level1techs.com/t/guide-integration-of-drivers-into-a-win7-11-image/30793)) can be used to integrate the latest updates if desired but this is not required if you plan on keeping Windows Update enabled once booted in the ISO. Additionally, ISOs build using UUP dump ship with the latest updates assuming that you build the latest version.
</details>

> [!IMPORTANT]
> The presence of OEMs keys can force the installation of specific editions of Windows editions (e.g. Home) which is problematic because an edition that supports group policies is required as mentioned in the [Download and Prepare a Stock Windows ISO](#103-download-and-prepare-a-stock-windows-iso) section. To circumvent this, you can either customize ``EI.cfg`` and ``PID.txt`` ([instructions](https://www.youtube.com/watch?v=R3yM3AV6q-8)) or remove every edition apart from the edition you would like to install using [NTLite](https://www.ntlite.com).

## 10.6. Fetching Required Files

There are primarily two prerequisites before installing Windows. These can be done later if you are willing to fetch them from another system but I would recommend getting them now. Store these somewhere that you can access offline after installing Windows such as a USB storage device as the installation process consists of not being connected to a network in the initial steps.

1. Download your NIC driver as it may not be packaged with Windows and must be installed in order to connect to a network
2. The ``bin`` folder from this repository which can be downloaded [here](https://github.com/valleyofdoom/PC-Tuning/archive/refs/heads/main.zip)

## 10.7. Boot Into the ISO

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

---

# 11. Configure Windows

## 11.1 OOBE Setup

- Windows Server may force you to enter a password which can be optionally be removed in later steps

- If you are configuring Windows 11, press ``Shift+F10`` to open CMD and execute ``oobe\BypassNRO.cmd``. This will allow us to continue without an internet connection by unlocking the ``continue with limited setup`` option as demonstrated in the video examples below

- See [assets/videos/oobe-windows7-example.mp4](/assets/videos/oobe-windows7-example.mp4)
- See [assets/videos/oobe-windows8-example.mp4](/assets/videos/oobe-windows8-example.mp4)
- See [assets/videos/oobe-windows10+-example.mp4](/assets/videos/oobe-windows10+-example.mp4)

- Windows Server Only:

  - To enable Wi-Fi, navigate to ``Manage -> Add Roles and Features`` in the Server Manager dashboard and enable ``Wireless LAN Service``

## 11.2. Unrestricted PowerShell Execution Policy

> [!WARNING]
> 🔒 Setting the PowerShell Execution Policy to Unrestricted may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting. Alternatively, ``-ExecutionPolicy Bypass`` can be used when starting a PowerShell instance instead of configuring it globally.

This is required to execute the scripts within the repository. Open PowerShell as administrator and enter the command below.

```powershell
Set-ExecutionPolicy Unrestricted
```

## 11.3. Import ``bin`` Folder

Move the ``bin`` folder that you downloaded prior to installing Windows to the ``C:`` drive as outlined in the [Fetching Required Files](#106-fetching-required-files) section. If you haven't downloaded it yet, you will need to fetch it from another system as you don't have network access at this stage. The complete path should be ``C:\bin``.

## 11.4. Merge the Registry Options

> [!WARNING]
> 🔒 Some changes outlined in the table below may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

The registry settings are merged with the ``apply-registry.ps1`` script. As for which options get applied, there are outlined in the table below which this can be customized by editing ``C:\bin\registry-options.json`` in a text editor and setting properties to either ``true`` or ``false``. You can backup the config file so that you don't need to modify it each time you reinstall Windows.

### 11.4.1. Registry Options Documentation (Required Reading)

> [!IMPORTANT]
> As of now, the script does not revert options if re-run. For example, if the script was run with an option set to ``true``, then running the script with a given option set to ``false`` will not revert the changed made as the script is unaware of the previous state of the registry keys associated with the option. This functionality may be implemented in the future but for now, use the ``-get_option_keys <option>`` argument with the script to get all relevant keys for a given option so that you can revert them manually.

|Option|Notes|Default Value|
|---|---|---|
|``disable windows update``|🔒 A value of ``true`` may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.<br><br>Telemetry, intrusive, prevents CPU overhead and installation of unwanted updates. Disabling Windows Update is in Microsoft's recommendations for configuring devices for real-time performance ([1](https://learn.microsoft.com/en-us/windows/iot/iot-enterprise/soft-real-time/soft-real-time-device)). Alternatively automatic updates can be disabled instead of disabling Windows Update completely which achieves the same effect by configuring ``disable windows update`` to ``false`` and ``disable automatic windows updates`` to ``true``<br><br>This option does not affect upgrades which can be controlled using group policies ([instructions](https://www.tenforums.com/tutorials/159624-how-specify-target-feature-update-version-windows-10-a.html)). However, you are limited to preventing upgrades until the specified version reaches end-of-life|``false``|
|``disable automatic windows updates``|Prevents automatic download and installation of Windows updates as the process can be intrusive compared to disabling Windows Update completely. This option is overridden if ``disable windows update`` is set to ``true``<br><br>This option does not affect upgrades which can be controlled using group policies ([instructions](https://www.tenforums.com/tutorials/159624-how-specify-target-feature-update-version-windows-10-a.html)). However, you are limited to preventing upgrades until the specified version reaches end-of-life|``true``|
|``disable driver installation via windows update``|Prevents outdated, vulnerable and bloated drivers from being installed via Windows Update. It is recommended to manually only install ones that you require along with the latest version directly from the manufacture's website as outlined in the [Install Drivers](#115-install-drivers) section. This option is overridden if ``disable windows update`` is set to ``true``|``true``|
|``disable user account control``|🔒 A value of ``true`` may negatively impact security. Users should assess the security risk involved with modifying the mentioned setting<br><br>Eliminates [this](https://learn.microsoft.com/en-us/windows/security/application-security/application-control/user-account-control/how-it-works#uac-elevation-prompts) subjectively intrusive UAC elevation prompt. Disabling UAC may negatively impact security as all processes are run with administrator privileges by default ([1](https://www.howtogeek.com/124754/htg-explains-why-you-shouldnt-disable-uac/), [2](https://raptor.solutions/the-risks-of-disabling-uac-in-windows-10/)). If you choose to leave UAC enabled, I would recommend setting it to the highest level (most restrictive) in control panel as the default level can be exploited ([1](https://devblogs.microsoft.com/oldnewthing/20160816-00/?p=94105))|``false``|
|``disable windows marking file attachments with information about their zone of origin``|🔒 A value of ``true`` may negatively impact security. Users should assess the security risk involved with modifying the mentioned setting<br><br>Prevents [this](https://www.tenforums.com/tutorials/85418-how-disable-downloaded-files-being-blocked-windows.html) intrusive security warning as downloaded files are constantly required to be unblocked however this may negatively impact security as the user will not be notified of blocked files via a security warning prompt ([1](https://www.tenforums.com/tutorials/85418-how-disable-downloaded-files-being-blocked-windows.html))|``true``|
|``disable windows defender``|🔒 A value of ``true`` may negatively impact security. Users should assess the security risk involved with modifying the mentioned setting<br><br>Prevents CPU overhead and interferes with the CPU operating in C-State 0 ([1](https://www.techpowerup.com/295877/windows-defender-can-significantly-impact-intel-cpu-performance-we-have-the-fix)). Instead, run system scans frequently, keep UAC enabled and favor free, open source and reputable software. Stay away from proprietary software where you can and ensure to scan files and executables with [VirusTotal](https://www.virustotal.com/gui/home/upload) before opening them|``true``|
|``disable malicious software removal tool updates``|🔒 A value of ``true`` may negatively impact security. Users should assess the security risk involved with modifying the mentioned setting<br><br>Prevent Windows offering Malicious Software Removal Tool through Windows Update|``true``|
|``disable PC is out of support message``|Disables [this](https://support.microsoft.com/en-us/topic/you-received-a-notification-your-windows-7-pc-is-out-of-support-3278599f-9613-5cc1-e0ee-4f81f623adcf) intrusive message|``true``|
|``disable automatic maintenance``|Intrusive|``true``|
|``disable search indexing``|Prevents CPU overhead as files are indexed constantly in the background|``true``|
|``disable program compatibility assistant``|Prevent Windows applying changes anonymously after running troubleshooters|``true``|
|``disable customer experience improvement program``|Telemetry ([1](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/jj618322(v=ws.11)))|``true``|
|``disable fault tolerant heap``|Prevents Windows autonomously applying mitigations to prevent future crashes on a per-application basis ([1](https://learn.microsoft.com/en-us/windows/win32/win7appqual/fault-tolerant-heap))|``true``|
|``disable sticky keys``|Disables the *Do you want to turn on Sticky Keys?* promt when the hotkey is pressed a certain number of times. This is severely intrusive in applications that utilize the ``Shift`` key for controls such as games|``true``|
|``disable pointer acceleration``|Ensures one-to-one mouse response for games that do not subscribe to raw input events and on Desktop|``true``|
|``disable fast startup``|Interferes with shutting down in the sense that the system does not enter S5 which can lead to unexpected issues ([explanation](https://www.youtube.com/watch?v=OBGxt8zhbRk)). See the [Fast Startup, Standby and Hibernate](#616-fast-startup-standby-and-hibernate) section for related information. It is possible to shut down  properly without disabling Fast Startup by holding ``Shift`` while clicking ``Shut down`` in the start menu. However, the downside to this is that you may forget to hold the ``Shift`` key.|``true``|
|``disable windows error reporting``|Telemetry|``true``|
|``reserve 10% of CPU resources for low-priority tasks instead of the default 20%``|On an optimized system with few background tasks, it is desirable to allocate most of the CPU time to the foreground process. See [here](https://learn.microsoft.com/en-us/windows/win32/procthread/multimedia-class-scheduler-service) for more information|``true``|
|``disable remote assistance``|Security risk|``true``|
|``show file extensions``|Security risk ([1](https://www.youtube.com/watch?v=nYdS3FIu3rI))|``true``|
|``disable corner navigation``|Disables [corner navigation](https://edu.gcfglobal.org/en/windows8/getting-started-with-windows-8/1) on Windows 8 which may become intrusive|``true``|
|``disable search the web or display web results in search``|Telemetry|``true``|
|``disable notifications network usage``|Telemetry, prevents CPU overhead due to polling ([1](https://learn.microsoft.com/en-gb/windows/privacy/manage-connections-from-windows-operating-system-components-to-microsoft-services#10-live-tiles))|``true``|
|``disable sign-in and lock last interactive user after a restart``|Intrusive|``true``|
|``disable gamebarpresencewriter``|Prevents CPU overhead as the process runs constantly in the background and is not required for Game Mode or Game Bar to function from my testing|``true``|
|``disable telemetry``|Telemetry|``true``|
|``disable retrieval of online tips and help in the immersive control panel``|Telemetry|``true``|
|``enable the legacy photo viewer``|Alternative option to the Windows Photos app|``true``|
|``disable typing insights``|Telemetry|``true``|
|``disable background apps``|Disabled via policies as the option is not available in the interface on Windows 11|``true``|
|``disable suggestions in the search box and in search home``|Telemetry and intrusive|``true``|
|``allocate processor resources primarily to programs``|On client editions of Windows, this has no effect from the default behavior but is changed to ensure consistency between all editions including Windows Server|``true``|
|``disable widgets``|Security risk ([1](https://www.youtube.com/watch?v=m9d-fXl3Z8k))|``true``|

### 11.4.2. Apply Options

- Open PowerShell as administrator and enter the command below. If the command fails, then try to disable tamper protection in Windows Defender (Windows 10 1909+). If that doesn't work, reboot then re-execute the command again

    ```powershell
    C:\bin\apply-registry.ps1
    ```

- Ensure that the script prints a "successfully applied" message to the console, if it does not then the registry keys were not successfully merged

- After and only after a restart, you can establish an internet connection as the Windows update policies will take effect

## 11.5. Install Drivers

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

- I would advise against installing drivers via Windows Update as they can be outdated compared to the ones provided by the vendor

- See [Chipset Device "Drivers" (= INF files) | Fernando](https://winraid.level1techs.com/t/intel-chipset-device-drivers-inf-files/30920)

- GPU drivers will be installed in the [Configure the Graphics Driver](#1120-configure-the-graphics-driver) section so do not install them at this stage

- You can find drivers by searching for drivers that are compatible with your device's HWID. See [media/device-hwid-example.png](/assets/images/find-driver-key-example.png) in regard to finding your HWID in Device Manager for a given device

- Try to obtain the driver in its INF form so that it can be installed in Device Manager as executable installers usually install other bloatware along with the driver itself. Sometimes you can extract the installer's executable with 7-Zip

- It is recommended to update and install the following:

  - Network Interface Controller. If you do not have internet access at this stage, you will need to download your NIC driver from another device or dual-boot as they may not be packaged at all with Windows

  - [USB](https://winraid.level1techs.com/t/usb-3-0-3-1-drivers-original-and-modded/30871) and [NVMe](https://winraid.level1techs.com/t/recommended-ahci-raid-and-nvme-drivers/28310) (if you are configuring Windows 7, both may have already been integrated in the [Download and Prepare a Stock Windows ISO](#103-download-and-prepare-a-stock-windows-iso) section)

  - [SATA](https://winraid.level1techs.com/t/recommended-ahci-raid-and-nvme-drivers/28310) (required on Windows 7 as the stock driver does not support Message Signaled Interrupts)

- Other required drivers can be installed with [Snappy Driver Installer Origin](https://www.snappy-driver-installer.org)

## 11.6. Privacy Options (Windows 8+)

Disable all unnecessary permissions in the ``Privacy`` section by pressing ``Win+I``.

## 11.7. Time, Language and Region

- Configure settings by typing ``intl.cpl`` and ``timedate.cpl`` in ``Win+R``

- Windows 10+ Only

  - Configure settings in ``Time & Language`` by pressing ``Win+I``

    - If you intend to exclusively use one language and keyboard layout, ensure that is the case in actuality so that you don't need to toggle the language bar hotkeys which can become intrusive as the hotkey can be accidentally pressed

## 11.8. Configure a Web Browser

Configure a browser of your choice.

- See [privacytests.org](https://privacytests.org)

- See [Desktop Browsers | Privacy Guides](https://www.privacyguides.org/en/desktop-browsers)

## 11.9. Scheduled Tasks

There are a handful of scheduled tasks that ship with Windows which can be assessed using [TaskSchedulerView](https://www.nirsoft.net/utils/task_scheduler_view.html). Assessing them can help in having finer control as to what runs on your system silently whether it be updates-related, telemetry-related, defender-related and more. Consider the ``Last Run``, ``Next Run`` and ``Triggers`` column to evaluate whether there is any point disabling the task in question.

## 11.10. Activate Windows

Use the commands below to activate Windows using your license key if you do not have one linked to your HWID. Ensure that the activation process was successful by verifying the activation status in computer properties. Open CMD as administrator and enter the commands below.

```bat
slmgr /ipk <license key>
```

```bat
slmgr /ato
```

## 11.11. Miscellaneous

- To declutter the interface, disable features on the taskbar and unpin shortcuts and tiles from the taskbar and start menu

- Windows Server Only:

  - In Server Manager, navigate to ``Manage -> Server Manager Properties`` and enable the option to prevent Server Manager from starting automatically

  - Set the ``Windows Audio`` and ``Windows Audio Endpoint Builder`` services startup type to automatic by typing ``services.msc`` in ``Win+R``

  - Navigate to ``Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`` by typing ``gpedit.msc`` in ``Win+R`` and disable ``Password must meet complexity requirements``

    - Open CMD and type ``gpupdate /force`` to apply the changes immediately

  - Navigate to ``Computer Configuration -> Administrative Templates -> System`` by typing ``gpedit.msc`` in ``Win+R`` and disable ``Display Shutdown Event Tracker`` to disable the shutdown prompt

  - To remove the user password, enter your current password and leave the new/confirm password fields blank in ``User Accounts`` by typing ``control userpasswords`` in ``Win+R``

## 11.12. Disable Superfetch and Prefetch

If a HDD isn't present in the system then Superfetch and Prefetch can be disabled with the command below in CMD. Disabling SysMain is in Microsoft's recommendations for configuring devices for real-time performance ([1](https://learn.microsoft.com/en-us/windows/iot/iot-enterprise/soft-real-time/soft-real-time-device)) and the ``C:\Windows\Prefetch`` folder should no longer be populated.

  ```bat
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
  ```

## 11.13. Operating System and Partition Name

Configure the operating system and drive's partition name. It is recommended to set it to something meaningful or unique such has ``W10 22H2 Work`` or ``W10 22H2 Gaming`` for clarity when dual-booting or when multiple drives are present. Open CMD as administrator and enter the commands below.

  ```bat
  bcdedit /set {current} description "OS_NAME"
  ```

  ```bat
  label C: "OS_NAME"
  ```

## 11.14. Show Tray Icons

I would recommend enabling the ``Always show all icons in the notification area`` for better process management. Hiding icons in the tray area can partially be considered a security risk since you won't be aware of potentially malicious or unwanted programs running silently.

## 11.15. Disable Hibernation

Windows has a toggle that disables Fast Startup, hibernation and removes ``C:\hiberfil.sys``.  It is recommended to shut down instead of saving software state to disk. Open CMD as administrator and enter the command below.

```bat
powercfg /h off
```

## 11.16. Install Runtimes

These are runtimes are common dependencies including a magnitude of applications.

- [Visual C++ Redistributable](https://github.com/abbodi1406/vcredist)
- [.NET 4.8](https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48) (ships with Windows 10 1909+)
- [WebView](https://developer.microsoft.com/en-us/microsoft-edge/webview2)
- [DirectX](https://www.microsoft.com/en-gb/download/details.aspx?id=8109) (game launchers typically install this silently)

## 11.17. Handle Bloatware

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

I heavily discourage running debloating scripts or removing components other than actual bloatware such as Candy Crush or whatever may be packaged with Windows these days to avoid breaking your operating system. It can be argued that removing these applications have no performance benefit if they don't actively run in the background which can be assessed in Task Manager. To adopt the approach of only removing or disabling what actively runs in the background, use [Process Explorer](#1126-replace-task-manager-with-process-explorer) and sort processes by either ``Context Switch Delta`` or ``Cycles Delta`` to assess what can be removed. The update speed can be changed in ``View -> Update Speed`` depending on your tolerance.

- AppxPackagesManager can be used to uninstall Appx packages which ship with Windows. I recommend keeping ``Microsoft.WindowsStore`` (Microsoft Store) at the very least so that you can download applications in the future. Appx packages can also be installed without the Microsoft Store ([instructions](https://superuser.com/questions/1721755/is-there-a-way-to-install-microsoft-store-exclusive-apps-without-store))

- Removing OneDrive involves opening CMD as administrator and entering the command below

    ```bat
    for %a in ("SysWOW64" "System32") do (if exist "%windir%\%~a\OneDriveSetup.exe" ("%windir%\%~a\OneDriveSetup.exe" /uninstall)) && reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
    ```

- Disabling (not uninstalling) Chromium Microsoft Edge involves the steps below. The browser should be disabled instead of uninstalled to retain the WebView runtime

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

  - Windows 10 Only:

    - Uninstall bloatware in ``Apps -> Apps and Features`` by pressing ``Win+I`` (this can also be managed in AppxPackagesManager)
    - In the ``Optional features`` section, you can uninstall everything that you don't need if desired

  - Windows 11 Only:

    - Uninstall bloatware in ``Apps -> Installed apps`` by pressing ``Win+I`` (this can also be managed in AppxPackagesManager)
    - In the ``System -> Optional features`` section, you can uninstall everything that you don't need if desired

- If Windows Defender was disabled in the [Merge the Registry Options](#114-merge-the-registry-options) section,``smartscreen.exe`` ignores the registry key that controls whether it runs in the background persistently on later versions of Windows. For this reason, open CMD as TrustedInstaller with ``C:\bin\MinSudo.exe --TrustedInstaller --Privileged`` and enter the command below to prevent it running in the background

    ```bat
    taskkill /f /im smartscreen.exe > nul 2>&1 & ren C:\Windows\System32\smartscreen.exe smartscreen.exee
    ```

- You can use Task Manager to check for residual bloatware that is running in the background

## 11.18. Optional Features

Optional features can be accessed by typing ``OptionalFeatures`` in ``Win+R``. Enable/disable features that you do/don't need. If Windows Update is disabled then you likely won't be able to install features and instead, must install an offline package using DISM.

## 11.18.1. NET 3.5

Some applications still utilize the NET 3.5 runtime so I would recommend installing it just in case. As mentioned previously, you won't be able to install it in the Optional Features window if Windows Update is disabled but can instead, be installed using an offline package.

For using the offline package, download and extract a Windows ISO (e.g. ``C:\EXTRACTED_ISO``) and open CMD as administrator. Replace ``C:\EXTRACTED_ISO\sources\sxs`` with the correct path to the ``\sources\sxs`` folder in the ISO that you extracted and run the command.

```bat
DISM /Online /Enable-Feature /FeatureName:NetFx3 /LimitAccess /Source:"C:\EXTRACTED_ISO\sources\sxs"
```

## 11.19. Install 7-Zip

Download and install [7-Zip](https://www.7-zip.org). Open ``C:\Program Files\7-Zip\7zFM.exe`` then navigate ``Tools -> Options`` and associate 7-Zip with all file extensions by clicking the ``+`` button. You may need to click it twice to override existing associated extensions.

## 11.20. Configure the Graphics Driver

- See [docs/configure-nvidia.md](/docs/configure-nvidia.md)
- See [docs/configure-amd.md](/docs/configure-amd.md)

## 11.21. Configure MSI Afterburner

If you use [MSI Afterburner](https://www.msi.com/Landing/afterburner/graphics-cards), download and install it now.

- I recommend configuring a static fan speed as using the fan curve feature requires the program to run continually however, it is up to you whether to use the curve or not

- To automatically load profile 1 (as an example) when Windows boots, the command below can be used with Task Scheduler ([instructions](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10))

    ```bat
    "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe" /Profile1 /Q
    ```

## 11.22. Display Resolutions and Scaling Modes

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

You may have optionally found a stable overclock for your display in earlier sections using [Custom Resolution Utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) which you can dial in now.

- Typically, you have the option of performing scaling on the GPU or display. Native resolution does not require scaling thus results in identity (no) scaling. Furthermore, identity scaling renders most of the scaling options in the GPU control panel obsolete. If you are using a non-native resolution, there is an argument for favoring display scaling due to less GPU processing

- Aim for an ``actual`` integer refresh rate such as 60.00/240.00, not 59.94/239.76

- There are many ways to achieve the same outcome regarding GPU and display scaling. See the table in the link below for example scenarios

  - See [What Is Identity Scaling and How Can You Use It?](/docs/research.md#8-what-is-identity-scaling-and-how-can-you-use-it)

  - Optionally use QueryDisplayScaling to query the current scaling mode

- On systems with an NVIDIA GPU, ensure that the ``Display`` option for the ``Perform scaling on`` setting is still available. If it is not, then find out what change you made in CRU results in it not being accessible through trial and error. This can be accomplished by running ``reset.exe`` to reset the settings to default then re-configure CRU. After each change, run ``restart64.exe`` then check whether the option is still available

- Ensure your resolution is configured properly by typing ``rundll32.exe display.dll,ShowAdapterSettings`` in ``Win+R``

## 11.23. Install Open-Shell (Windows 8+)

Open-Shell is a FOSS alternative to the Windows Start Menu.

- Download and install [Open-Shell](https://github.com/Open-Shell/Open-Shell-Menu). Only install the ``Open-Shell Menu``

- Settings:

  - General Behavior

    - Check for Windows updates on shutdown - Disable

- Windows 8 Only:

  - Open ``"C:\Program Files\Open-Shell\Start Menu Settings.lnk"``, enable ``Show all settings`` then navigate to the Windows 8 Settings section and set ``Disable active corners`` to ``All``

## 11.24. Spectre, Meltdown and CPU Microcode

> [!WARNING]
> 🔒 Disabling Spectre and Meltdown may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Disabling Spectre and Meltdown is an age-old trick familiar amongst many individuals however with newer platforms and system architecture, there may be a performance regression ([1](https://www.phoronix.com/review/amd-zen4-spectrev2)). For this reason, extensive tests should be carried out to determine how performance is impacted and whether performance scales positively, negatively or not at all. Its state can be manipulated with the [InSpectre](https://www.grc.com/inspectre.htm) tool.

- AMD is unaffected by Meltdown

- A minority of anticheats (FACEIT) require Meltdown to be enabled

- If desired, the microcode update version loaded into the CPU can be manipulated depending on whether the operating system microcode version is newer than the microcode version on the motherboard by removing the DLLs ([1](https://www.pcgamingwiki.com/wiki/Windows#Force_the_use_of_the_motherboard_microcode_version_instead_of_the_one_from_the_OS)). This can be done by opening CMD as TrustedInstaller with ``C:\bin\MinSudo.exe --TrustedInstaller --Privileged`` and entering the commands below

    ```bat
    ren C:\Windows\System32\mcupdate_GenuineIntel.dll mcupdate_GenuineIntel.dlll
    ```

    ```bat
    ren C:\Windows\System32\mcupdate_AuthenticAMD.dll mcupdate_AuthenticAMD.dlll
    ```

- Reboot and use [InSpectre](https://www.grc.com/inspectre.htm) and [CPU-Z's](https://www.cpuid.com/softwares/cpu-z.html) validation feature to check the status or version after a reboot

## 11.25. Configure Power Options

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

To be completed.

## 11.26. Replace Task Manager with Process Explorer

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

## 11.27. Disable Process Mitigations (Windows 10 1709+)

> [!WARNING]
> 🔒 Disabling process mitigations may negatively impact security and expose the system to vulnerabilities. Users should evaluate the security risks associated with modifying the specified setting.

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

The script below can be used to disable [process mitigations](https://docs.microsoft.com/en-us/powershell/module/processmitigations/set-processmitigation?view=windowsserver2019-ps). Effects can be viewed with ``Get-ProcessMitigation -System`` in PowerShell or in Windows Defender's ``Exploit Protection`` page.

```bat
@echo off
setlocal EnableDelayedExpansion

DISM > nul 2>&1 || echo error: administrator privileges required && exit /b 1

:: initialize mask to get mask length
PowerShell Set-ProcessMitigation -System -Disable CFG
if not %errorlevel% == 0 (
    echo error: unsupported windows version >&2
    exit /b 1
)

:: get current mask
for /f "tokens=3 skip=2" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions"') do (
    set "mitigation_mask=%%a"
)

echo info: current mask - %mitigation_mask%

:: set all values in current mask to 2 (disable all mitigations)
for /L %%a in (0,1,9) do (
    set "mitigation_mask=!mitigation_mask:%%a=2!"
)

echo info: modified mask - %mitigation_mask%

:: apply mask to kernel
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "%mitigation_mask%" /f > nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "%mitigation_mask%" /f > nul 2>&1

exit /b 0
```

## 11.28. Configure Memory Management Settings (Windows 8+)

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

- Open PowerShell and enter the command below to review memory management options

    ```powershell
    Get-MMAgent
    ```

- Optionally use the command below as an example to disable a given setting. If you left Superfetch and Prefetch enabled in the [Disable Superfetch and Prefetch](#1112-disable-superfetch-and-prefetch) section, then you likely want the prefetching related features enabled

    ```powershell
    Disable-MMAgent -MemoryCompression
    ```

## 11.29. Configure the Network Adapter

- Open ``Network Connections`` by typing ``ncpa.cpl`` in ``Win+R``

- Disable any unused network adapters then right-click your main one then select ``Properties``

- Disable ``NetBIOS over TCP/IP`` for all network adapters in ``Internet Protocol Version 4 (TCP/IPv4) -> Properties -> General -> Advanced -> WINS`` to prevent unnecessary system listening ([1](https://github.com/djdallmann/GamingPCSetup/blob/master/CONTENT/DOCS/NETWORK/README.md))

- Optionally configure DNS settings

  - See [DNS Resolvers - Recommended Providers | Privacy Guides](https://www.privacyguides.org/en/dns)

## 11.30. Configure Audio Devices

- The sound control panel can be opened by typing ``mmsys.cpl`` in ``Win+R``

- Disable unused Playback and Recording devices

- I would recommend avoid using audio enhancements as they appear to marginally waste resources ([1](/assets/images/audio%20enhancements-benchmark.png))

- Optionally set the option in the communications tab to ``Do nothing`` to prevent automatic adjustment of audio levels between audio sources as this is an annoyance for the majority of users ([1](https://multimedia.easeus.com/ai-article/windows-audio-ducking.html), [2](https://superuser.com/questions/1147371/how-can-i-disable-automatic-windows-7-8-10-audio-ducking))

- Minimize the size of the audio buffer with [REAL](https://github.com/miniant-git/REAL)/[LowAudioLatency](https://github.com/spddl/LowAudioLatency) or on your DAC ([1](https://www.youtube.com/watch?v=JTuZvRF-OgE&t=464s)). Beware of audio dropouts due to the CPU not being able to keep up under load

  - Be warned regarding CPUs being reserved or underutilized with the usage of the mentioned programs ([1](https://github.com/miniant-git/REAL/issues/9))

## 11.31. Configure Device Manager

- Open Device Manager by typing ``devmgmt.msc`` in ``Win+R``

- Navigate to ``View -> Devices by type``

  - In the ``Disk drives`` category, disable write-cache buffer flushing on all drives in the ``Properties -> Policies`` section
  - In the ``Network adapters`` category, navigate to ``Properties -> Advanced`` and disable any power-saving features

- Navigate to ``View -> Devices by connection``

  - Disable any PCIe, SATA, NVMe and XHCI controllers and USB hubs with nothing connected to them
  - Disable everything that isn't the GPU on the same PCIe port

- Navigate to ``View -> Resources by connection``

  - Disable any unneeded devices that are using an IRQ or I/O resources, always ask if unsure and take your time on this step
  - If there are multiple entries of the same devices and you are unsure which one is in use, refer back to the tree structure in ``View -> Devices by connection``. This is because a single device can use many resources (e.g. IRQs). You can also use [MSI Utility](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044) to check for duplicate and unneeded devices in case you accidentally miss any with the cluttered Device Manager tree structure

- Optionally use [DeviceCleanup](https://www.uwe-sieber.de/files/DeviceCleanup.zip) to remove hidden devices

## 11.32. Disable Driver Power-Saving

Open PowerShell and enter the command below to disable the ``Allow the computer to turn off this device to save power`` option for all applicable devices in Device Manager.

Re-plugging devices may cause this option to re-enable so either avoid doing so, run this command again each time or run it at system startup as a precautionary measure with Task Scheduler ([instructions](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)).

```powershell
Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | ForEach-Object { $_.enable = $false; $_.psbase.put(); }
```

## 11.33. Configure Event Trace Sessions (ETS)

This section outlines instructions to mass-toggle Event Trace Sessions which can be viewed by typing ``perfmon`` in ``Win+R`` then navigating to ``Data Collector Sets -> Event Trace Sessions``. Programs that rely on event tracers will not be able to log data until the required sessions are restored which is the purpose of creating two registry files to toggle between them. Open CMD as administrator and enter the commands below to build the registry files in the ``C:\`` directory. These registry files must be run with Trusted Installer (use [NSudo](https://github.com/M2TeamArchived/NSudo/releases/latest)) to prevent permission errors.

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

## 11.34. Optimize the File System

Open CMD as administrator and enter the commands below.

- Disable the creation of 8.3 character-length file names on FAT and NTFS-formatted volumes

  - See [Should you disable 8dot3 for performance and security? | TCAT Shelbyville](https://web.archive.org/web/20200217151754/https://ttcshelbyville.wordpress.com/2018/12/02/should-you-disable-8dot3-for-performance-and-security)

  - See [Windows Short (8.3) Filenames – A Security Nightmare? | Bogdan Calin](https://www.acunetix.com/blog/articles/windows-short-8-3-filenames-web-security-problem)

      ```bat
      fsutil behavior set disable8dot3 1
      ```

- Disable updates to the Last Access Time stamp on each directory when directories are listed on an NTFS volume. Disabling the Last Access Time feature improves the speed of file and directory access ([1](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-behavior#remarks)). Beware that this may affect backup and remote storage programs as per the official remarks ([1](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-behavior#remarks))

    ```bat
    fsutil behavior set disablelastaccess 1
    ```

## 11.35. Message Signaled Interrupts

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Message signaled interrupts (MSIs) are faster than traditional line-based interrupts and may also resolve the issue of shared interrupts which are often the cause of high interrupt latency and stability ([1](https://repo.zenk-security.com/Linux%20et%20systemes%20d.exploitations/Windows%20Internals%20Part%201_6th%20Edition.pdf)).

- Download and open [MSI Utility](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044) or [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy)

- MSIs can be enabled on devices that support it. It is worth noting that it may be in the developer's intention to not enable MSIs in the driver INF file hence MSIs will be disabled by default once the driver is installed. Namely, NVIDIA seems to selectively enable MSIs depending on the GPU architecture ([1](https://www.nvidia.com/en-us/geforce/forums/game-ready-drivers/13/528356)). Exercise with due care and carry out tests to determine whether changes result in positive performance scaling

  - You will BSOD if you enable MSIs for the stock Windows 7 SATA driver which you should have already updated as mentioned in the [Install Drivers](#115-install-drivers) section

- To verify whether a device is utilizing MSIs, restart your PC and check whether the given device has a negative IRQ in MSI Utility

- Although this step may have been caried out in an earlier section to rule out the hardware-related causes of IRQ sharing, the software-related causes of potential IRQ sharing can be assessed now by confirming that there is no IRQ sharing on your system by typing ``msinfo32`` in ``Win+R`` then navigating to the ``Conflicts/Sharing`` section

  - If the ``System timer`` device and ``High precision event timer`` are sharing IRQ 0, a solution to this is to disable the parent device's driver of ``System timer`` which is ``PCI standard ISA bridge``. This can be accomplished with the command below. It is important to note that disabling ``msisadrv`` breaks the keyboard on mobile devices

    ```bat
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\msisadrv" /v "Start" /t REG_DWORD /d "4" /f
    ```

## 11.36. XHCI Interrupt Moderation (IMOD)

On most systems, Windows 7 uses an IMOD interval of 1ms whereas recent versions of Windows use 0.05ms (50us) unless specified by the installed USB driver. This means that after an interrupt has been generated, the XHCI controller waits (buffer period) for the specified interval for more data to arrive before generating another interrupt which reduces CPU utilization but potentially results in data from a given device being supplied at an inconsistent rate in the event of expecting data from other devices within the buffer period that are connected to the same XHCI controller.

For example, a mouse with a 1kHz polling rate will report data every 1ms. While only moving the mouse with an IMOD interval of 1ms, interrupt moderation will not be taking place because interrupts are being generated at a rate less than or equal to the specified interval. Realistically while playing a fast-paced game, you will easily surpass 1000 interrupts/s with keyboard and audio interaction while moving the mouse hence there will be a loss of information because you will be expecting data within the waiting period from either devices. Although this is unlikely with an IMOD interval of 0.05ms (50us), it can still happen.

As an example, 1ms IMOD interval with an 8kHz mouse is already problematic because you are expecting data every 0.125ms which is significantly greater than the specified interval which results in a major bottleneck ([1](https://www.overclock.net/threads/usb-polling-precision.1550666/page-61#post-28576466)).

- See [How to persistently disable XHCI Interrupt Moderation | BoringBoredom](https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/xhci%20imod/xhci%20imod.md)

- Microsoft Vulnerable Driver Blocklist may need to be disabled with the command below in order to load the [RWEverything](http://rweverything.com) driver however a handful of in-game anticheats do not adhere to disabling the blocklist (e.g. CS2, THE FINALS)

    ```bat
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f
    ```

- In some cases, the interrupter index can change after a reboot meaning the address will become invalid if it is hard-coded. To work around this, you can simply disable IMOD for all interrupters by placing the [XHCI-IMOD-Interval.ps1](/bin/XHCI-IMOD-Interval.ps1) script somewhere safe and launching it at startup with Task Scheduler ([instructions](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10))

  ```bat
  PowerShell C:\XHCI-IMOD-Interval.ps1
  ```

- To determine whether changing the IMOD interval is taking effect, you can temporarily set the interval to ``0xFA00`` (62.5Hz). If the mouse cursor is visibly stuttering upon movement, then the changes are successfully taking effect

## 11.37. Configure Control Panel

It isn't a bad idea to skim through both the legacy and immersive control panel to ensure nothing is misconfigured.

## 11.38. Configuring Applications

- Install any programs and applications that you use (including games) to prepare us for the next steps

- If applicable, favor portable editions of programs as installers tend to leave bloatware behind even after uninstalling them however, this can be circumvented by using programs such as [Bulk-Crap-Uninstaller](https://github.com/Klocman/Bulk-Crap-Uninstaller)

### 11.38.1. NVIDIA Reflex

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

[NVIDIA Reflex](https://www.nvidia.com/en-us/geforce/news/reflex-low-latency-platform) minimizes queued frames in the GPU render queue by dynamically adjusting the framerate in GPU-intensive gaming scenarios and can be enabled in-game if the developer has added support for it. Although this minimizes latency, it acts as a dynamic framerate limiter and can result in minor stuttering or frametime variance. For this reason, I would recommend extensively benchmarking this rather than blindly enabling it in your chosen games.

- See [NVIDIA Reflex Low Latency - How It Works & Why You Want To Use It | Battle(non)sense](https://www.youtube.com/watch?v=QzmoLJwS6eQ)

### 11.38.2. Framerate Limit

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

- Cap your framerate at a multiple of your monitor refresh rate ([calculator](https://boringboredom.github.io/tools/fpscapcalculator)) to prevent frame mistiming and a rolling tearline ([1](https://www.youtube.com/watch?v=_73gFgNrYVQ), [2](https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/peripherals/mistiming/mistiming.md))

- Ensure that the GPU isn't fully utilized as lower GPU utilization reduces system latency ([1](https://www.youtube.com/watch?v=8ZRuFaFZh5M&t=859s), [2](https://www.youtube.com/watch?v=7CKnJ5ujL_Q))

- Capping your framerate with [RTSS](https://www.guru3d.com/files-details/rtss-rivatuner-statistics-server-download.html) instead of the in-game limiter will result in consistent frame pacing and a smoother experience as it utilizes busy-wait which offers higher precision than 100% passive-waiting but at the cost of noticeably higher latency and potentially greater CPU overhead ([1](https://www.youtube.com/watch?t=377&v=T2ENf9cigSk), [2](https://en.wikipedia.org/wiki/Busy_waiting)). Disabling the ``Enable dedicated encoder server service`` setting prevents ``EncoderServer.exe`` from running

### 11.38.3. Presentation Mode

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

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

### 11.38.4. Game Mode

Ensure that Xbox Game Bar acknowledges that the game that you are running or have installed. If not, open Game Bar by pressing ``Win+G`` and enabling ``Remember this is a game`` while it is open. This also ensures that Game Mode functions properly.

### 11.38.5. Media Player

- [mpv](https://mpv.io) or [mpv.net](https://github.com/stax76/mpv.net)
- [mpc-hc](https://mpc-hc.org) ([updated fork](https://github.com/clsid2/mpc-hc))
- [VLC](https://www.videolan.org)

### 11.38.6. QoS Policies

QoS DSCP policies allow Windows to prioritize packets of an application.

- See [assets/images/dscp-46-qos-policy.png](/assets/images/dscp-46-qos-policy.png)

  - See [DSCP and Precedence Values | Cisco](https://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus1000/sw/4_0/qos/configuration/guide/nexus1000v_qos/qos_6dscp_val.pdf)

  - See [The QoS Expedited Forwarding (EF) Model | Network World](https://www.networkworld.com/article/761413/the-qos-expedited-forwarding-ef-model.html)

- See [How Can You Verify Whether a DSCP QoS Policy Is Working?](/docs/research.md#2-how-can-you-verify-whether-a-dscp-qos-policy-is-working)

## 11.39. Kernel-Mode Scheduling (Interrupts, DPCs and more)

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Windows schedules interrupts and DPCs on CPU 0 for several kernel-mode modules by default. In any case, scheduling many tasks on a single CPU can introduce additional overhead and increased jitter due to them competing for CPU time. To alleviate this, affinities can be configured to isolate given modules from disturbances including servicing time-sensitive modules on underutilized CPUs instead of clumping everything on a single CPU.

- Use the xperf DPC/ISR report generated by the xperf-dpcisr.bat script to analyze which CPUs kernel-mode modules are being serviced on. You can not manage affinities if you do not know what is running and which CPU(s) they are running on to begin with. The same concept applies to user-mode threads. Additionally, verify whether interrupt affinity policies are performing as expected by analyzing per-CPU usage for the module in question while the device is busy

- Additionally, core-to-core-latency benchmarks can assist with decision-making in terms of affinity management

  - See [CXWorld/MicroBenchX](https://github.com/CXWorld/MicroBenchX)

- Ensure that the corresponding DPC for an ISR is processed on the same CPU ([example](/assets/images/isr-dpc-same-core.png)). Additional overhead can be introduced if they are processed on different CPUs due to increased inter-processor communication and interfering with cache coherence

- Use [Microsoft Interrupt Affinity Tool](https://www.techpowerup.com/download/microsoft-interrupt-affinity-tool) or [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy) to configure driver affinities. The device can be identified by cross-checking the ``Location`` in the ``Properties -> General`` section of a device in Device Manager

### 11.39.1.  GPU and DirectX Graphics Kernel

AutoGpuAffinity can be used to benchmark the most performant CPUs that the GPU-related modules are assigned to. Configure the ``custom_cpus`` option in the config file if applicable. This option is useful for selecting a certain set of cores to benchmark such as P-Cores or a specific CCX/CCD.

### 11.39.2. XHCI and Audio Controller

The XHCI and audio controller related modules generate a substantial amount of interrupts upon interaction respective of the relevant device. Isolating the related modules to an underutilized CPU is beneficial for reducing contention.

### 11.39.3. Network Interface Card

The NIC must support MSI-X for Receive Side Scaling to function properly ([1](https://old.reddit.com/r/intel/comments/9uc03d/the_i219v_nic_on_your_new_z390_motherboard_and)). In most cases, RSS base CPU is enough to migrate DPCs and ISRs for the NIC driver which eliminates the need for an interrupt affinity policy. However, if you are having trouble migrating either to other CPUs, try configuring both.

The command below can be used to configure RSS base CPU. Ensure to change the driver key to the one that corresponds to the correct NIC. Keep in mind that the amount of RSS queues determines the amount of consecutive CPUs that the network driver is scheduled on. For example, the driver will be scheduled on CPU 2/3/4/5 (2/4/6/8 with HT/SMT enabled) if RSS base CPU is set to 2 along with 4 RSS queues configured.

- See [How many RSS Queues do you need?](/docs/research.md#4-how-many-rss-queues-do-you-need)

- See [assets/images/find-driver-key-example.png](/assets/images/find-driver-key-example.png) to obtain the correct driver key in Device Manager

    ```bat
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*RssBaseProcNumber" /t REG_SZ /d "2" /f
    ```

- If RSS is not functioning as expected, see [this](https://github.com/djdallmann/GamingPCSetup/blob/master/CONTENT/RESEARCH/NETWORK/README.md#q-my-onboard-network-adapter-i225-v-supports-rss-msi-and-msi-x-but-why-is-my-indirection-table-missing-that-gives-proper-support-for-rss-in-microsoft-windows) for a potential workaround

## 11.40. User-Mode Scheduling (Processes, Threads)

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

There are several methods to set affinities for processes. One of which is Task Manager but only persists until the process is closed. A more popular and permanent solution is [Process Lasso](https://bitsum.com) which allows the configuration to be saved however, a process must run continually in the background which introduces minor overhead. To work around this, you can simply launch the application with a specified CPU affinity which eliminates the requirement of programs such as Process Lasso for affinity management at the expense of usability.

- Use the [CPU Affinity Mask Calculator](https://bitsum.com/tools/cpu-affinity-calculator) to determine the desired hexal affinity bitmask

- In some cases, process can be protected so specifying the affinity may fail. To work around this, you can try specifying the affinity for the parent processes which will cause the child process to inherit the affinity when spawned. As an example, a game launcher is usually the parent process of a game. [Process Explorer's](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer) process tree can be used to identify parent and child processes

  - [Process Hacker](https://processhacker.sourceforge.io) and [WindowsD](https://github.com/katlogic/WindowsD) can bypass several process-level protections through exploits but is not advised as they interfere with anticheats

- It may be worth benchmarking the performance scaling of your application against core count as it may behave differently due to poor scheduling implementations from the application and/or OS. In some cases, it is possible that the application may perform better with fewer cores assigned to it via an affinity mask ([1](https://developer.nvidia.com/blog/limiting-cpu-threads-for-better-game-performance)). This will also give you a rough idea as to how many cores you can reserve with ReservedCpuSets

### 11.40.1. Starting a Process with a Specified Affinity Mask

The command below starts ``notepad.exe`` with an affinity of CPU 1 and CPU 2 as an example which will reflect in Task Manager. This command can be placed in a batch script for easy access and must be used each time to start the desired application with the specified affinity.

```bat
start /affinity 0x6 notepad.exe
```

### 11.40.2. Specifying an Affinity Mask for Running Processes

Sometimes, the processes that you would like to set an affinity mask to are already running, so the previous command is not applicable here. As a random example, the command below sets the affinity mask of the ``svchost.exe`` and ``audiodg.exe`` processes to CPU 3. Use this example to create a PowerShell script then have it run at startup using Task Scheduler ([instructions](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)).

```powershell
Get-Process @("svchost", "audiodg") -ErrorAction SilentlyContinue | ForEach-Object { $_.ProcessorAffinity=0x8 }
```

## 11.41. Reserved CPU Sets (Windows 10+)

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

[ReservedCpuSets](https://github.com/valleyofdoom/ReservedCpuSets) can be used to prevent Windows routing ISRs, DPCs and scheduling other threads on specific CPUs. Isolating modules from user and kernel-level disturbances helps reduce contention, jitter and allows time-sensitive modules to get the CPU time they require.

- As mentioned in the [User-Mode Scheduling (Processes, Threads)](#1140-user-mode-scheduling-processes-threads) section, you should determine how well or poorly your application's performance scales with core count to give you a rough idea as to how many cores you can afford to reserve

- As interrupt affinity policies, process and thread affinities have higher precedence, you can use this hand in hand with user-defined affinities to go a step further and ensure that nothing except what you assigned to specific CPUs will be scheduled on those CPUs

- Ensure that you have enough cores to run your real-time application on and aren't reserving too many CPUs to the point where isolating modules does not yield real-time performance

- As CPU sets are considered soft policies, the configuration isn't guaranteed. A CPU-intensive process such as a stress-test will utilize the reserved cores if required

> [!IMPORTANT]
> Unexpected behavior occurs when a process affinity is set to both reserved and unreserved CPUs. Ensure to set the affinity to either reserved or unreserved CPUs, not a combination of both.

### 11.41.1. Use Cases

- Hinting to the OS to schedule tasks on a group of CPUs. An example of this with modern platforms could be reserving E-Cores (efficiency cores) or either CCX/CCDs so that tasks are scheduled on P-Cores (performance cores) or other CCX/CCDs by default. With this approach, you can explicitly enforce background and unimportant tasks to be scheduled on the reserved CPUs. Note that this is purely an example and the logic can be flipped, but some latency-sensitive processes and modules are protected so affinity policies may fail which is a major limitation. There are several possibilities and trade-offs to consider. Note that performance can degrade when reserving E-Cores or other CCX/CCDs as applications may make use of them. Therefore, it is vital that you measure performance scaling when reserving cores whether it be one, a few or a set of CPUs

- Reserving CPUs that have specific modules assigned to be scheduled on them

## 11.42. Analyze Event Viewer

This step isn't required, but can help to justify unexplained performance issues or issues in general. Ensure that there are no errors present on Event Viewer by typing ``eventvwr.msc`` in ``Win+R`` as anything you may have changed to your operating system could lead to internal errors or exceptions being thrown periodically.

- Merge the ``ets-enable.reg`` file that was generated in the [Configure Event Trace Sessions (ETS)](#1133-configure-event-trace-sessions-ets) section as it is required for event logging

## 11.43. Virtualization Based Security (VBS)

Virtualization Based Security negatively impacts performance ([1](https://www.tomshardware.com/news/windows-11-gaming-benchmarks-performance-vbs-hvci-security)) and in some cases, it is enabled by default. Its status can be determined by typing ``msinfo32`` in ``Win+R`` and can be disabled ([instructions](https://www.tomshardware.com/how-to/disable-vbs-windows-11)) if required.

## 11.44. CPU Idle States

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](#3-benchmarking)).

Disabling idle states forces C-State 0, which can be seen in [HWiNFO](https://www.hwinfo.com), and is in Microsoft's recommendations for configuring devices for real-time performance ([1](https://learn.microsoft.com/en-us/windows/iot/iot-enterprise/soft-real-time/soft-real-time-device)). Forcing C-State 0 mitigates the undesirable delay to execute new instructions on a CPU that has entered a deeper power-saving state at the expense of higher temperatures and power consumption. Therefore, I would recommend keeping idle states enabled for the majority of readers as other problems can occur due to these side effects (e.g. throttling, power issues). The CPU temperature should not increase to the point of thermal throttling because you should have already assessed that in the [Stability, Hardware Clocking and Thermal Performance](#9-stability-hardware-clocking-and-thermal-performance) section.

If a static CPU frequency is not set, the effects of forcing C-State 0 should be assessed in terms of frequency boosting behavior. For example, you certainly wouldn't want to disable idle states when relying on Precision Boost Overdrive (PBO), Turbo Boost or similar features. Avoid disabling idle states with Hyper-Threading/Simultaneous Multithreading enabled as single-threaded performance is usually negatively impacted.

### 11.44.1. Enable Idle States (default)

```bat
powercfg /setacvalueindex scheme_current sub_processor 5d76a2ca-e8c0-402f-a133-2158492d58ad 0 && powercfg /setactive scheme_current
```

### 11.44.2. Disable Idle States

```bat
powercfg /setacvalueindex scheme_current sub_processor 5d76a2ca-e8c0-402f-a133-2158492d58ad 1 && powercfg /setactive scheme_current
```

## 11.45. Cleanup and Maintenance

- Use [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns) to remove any unwanted programs from launching at startup and check it often, especially after installing a program

- Some locations you may want to review for residual files

  - ``"C:\"``
  - ``"C:\Windows\Prefetch"``
  - ``"C:\Windows\SoftwareDistribution"``
  - ``"C:\Windows\Temp"``
  - ``"%userprofile%\AppData\Local\Temp"``
  - ``"%userprofile%\Downloads"``

- Configure Disk Cleanup

  - Open CMD and enter the command below, tick all the boxes except ``DirectX Shader Cache`` then press ``OK``

      ```bat
      cleanmgr /sageset:0
      ```

  - Run Disk Cleanup

      ```bat
      cleanmgr /sagerun:0
      ```

- Optionally clean the WinSxS folder to reduce the size of it ([1](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/clean-up-the-winsxs-folder?view=windows-11)) with the command below in CMD. Note that this can be a lengthy process

    ```bat
    DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
    ```

- Favor tools such as [Bulk-Crap-Uninstaller](https://github.com/Klocman/Bulk-Crap-Uninstaller) to uninstall programs as the regular control panel does not remove residual files
