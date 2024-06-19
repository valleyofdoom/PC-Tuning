# Configure the NVIDIA Driver

## 1. Table of Contents

- [2. Strip and Install the Driver](#2-strip-and-install-the-driver)
- [3. Configure NVIDIA Control Panel](#3-configure-nvidia-control-panel)
  - [3.1. Manage 3D Settings](#31-manage-3d-settings)
  - [3.2. Change Resolution](#32-change-resolution)
  - [3.3. Adjust Video  Settings](#33-adjust-video-color-settings)
  - [3.4. Lock GPU Clocks/P-State 0](#34-lock-gpu-clocksp-state-0)
- [3.5. Configure NVIDIA Inspector](#35-configure-nvidia-inspector)

## 2. Strip and Install the Driver

Download the latest game ready driver using the [advanced driver search](https://www.nvidia.com/download/find.aspx) page. DCH drivers are supported on Windows 10 1803+ ([1](https://nvidia.custhelp.com/app/answers/detail/a_id/4777/~/nvidia-dch%2Fstandard-display-drivers-for-windows-10-faq)).

- Extract the driver executable package with 7-Zip and remove all files and folders except the following:

    ```
    Display.Driver
    NVI2
    EULA.txt
    ListDevices.txt
    setup.cfg
    setup.exe
    ```

- Remove the following lines from ``setup.cfg`` (near the end of the file):

    ```
    <file name="${{EulaHtmlFile}}"/>
    <file name="${{FunctionalConsentFile}}"/>
    <file name="${{PrivacyPolicyFile}}"/>
    ```

- Run ``setup.exe`` to install the driver

- Open CMD and enter the command below to disable telemetry

    ```bat
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup\SendTelemetryData" /t REG_DWORD /d "0" /f
    ```

## 3. Configure NVIDIA Control Panel

### 3.1. Manage 3D Settings

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](/README.md#3-benchmarking)).

- Anisotropic filtering - Off

- Antialiasing - Gamma correction - Off

- Low Latency Mode - On

    > If a game supports the NVIDIA Reflex Low Latency mode, we recommend using that mode over the Ultra Low Latency mode in the driver. However, if you leave both on, the Reflex Low Latency mode will take higher priority automatically for you ([1](https://www.nvidia.com/en-gb/geforce/news/reflex-low-latency-platform))

- Power management mode - Prefer maximum performance

- Shader Cache Size - Unlimited

- Texture filtering - Quality - High performance

- Threaded Optimization - offloads GPU-related processing tasks on the CPU ([1](https://tweakguides.pcgamingwiki.com/NVFORCE_8.html)). It may harm frame pacing as it takes CPU time away from your real-time application but you should benchmark nonetheless. You should also determine whether you are already CPU bottlenecked if you do choose to enable the setting

- Ensure that settings aren't being overridden for programs in the ``Program Settings`` tab, such as Image Sharpening for some EAC games to prevent unexpected results

### 3.2. Change Resolution

- Output dynamic range - Full

### 3.3. Adjust Video Color Settings

- Dynamic range - Full

## 3.4. Lock GPU Clocks/P-State 0

Force P-State 0 with the [registry key](https://github.com/djdallmann/GamingPCSetup/blob/master/CONTENT/RESEARCH/WINDRIVERS/README.md#q-is-there-a-registry-setting-that-can-force-your-display-adapter-to-remain-at-its-highest-performance-state-pstate-p0) below (reboot required). Ensure to change the driver key to the one that corresponds to the correct NVIDIA GPU ([example](/assets/images/find-driver-key-example.png)). This mitigates the undesirable delay to execute new instructions when the unit enters a deeper power-saving state at the expense of higher idle temperatures and power consumption

```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
```

## 3.5. Configure NVIDIA Inspector

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](/README.md#3-benchmarking)).

- Download and extract [NVIDIA Profile Inspector](https://github.com/Orbmu2k/nvidiaProfileInspector)

- Disable ``Enable Ansel`` as it is injected in all games by the display drivers, regardless if the game supports Ansel or not which may cause conflicts with third-party tools or injectors ([1](https://www.pcgamingwiki.com/wiki/Nvidia#Ansel))

- If applicable, you can experiment with forcing Resizable BAR on unsupported games for a potential performance improvement by toggling the options below ([1](https://www.youtube.com/watch?v=ZTOtqWTFSK8))

  - rBAR - Feature

  - rBAR - Options

  - rBAR - Size Limit

- Disable ``CUDA - Force P2 State`` to prevent the memory clock frequency from downclocking during CUDA workloads as it enters P-State 2 despite following the steps in the [Lock GPU Clocks/P-State 0](#34-lock-gpu-clocksp-state-0) section ([1](/assets/images/cuda-force-p2-state-analysis.png))
