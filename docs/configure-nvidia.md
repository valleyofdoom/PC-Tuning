<h1 id="configure-the-nvidia-driver">Configure the NVIDIA Driver <a href="#configure-the-nvidia-driver">(permalink)</a></h1>

<h2 id="table-of-contents">1. Table of Contents <a href="#table-of-contents">(permalink)</a></h2>

- [1. Table of Contents](#table-of-contents)
- [2. Strip and Install the Driver](#strip-and-install-the-driver)
- [3. Configure NVIDIA Control Panel](#configure-nvidia-control-panel)
  - [3.1. Manage 3D Settings](#manage-3d-settings)
  - [3.2. Change Resolution](#change-resolution)
  - [3.3. Adjust Video  Settings](#adjust-video-color-settings)
  - [3.4. Lock GPU Clocks/P-State 0](#lock-gpu-clocksp-state-0)
- [3.5. Configure NVIDIA Inspector](#configure-nvidia-inspector)

<h2 id="strip-and-install-the-driver">2. Strip and Install the Driver <a href="#strip-and-install-the-driver">(permalink)</a></h2>

- Download the latest game ready driver using the [advanced driver search](https://www.nvidia.com/download/find.aspx) page. DCH drivers are supported on Windows 10 1803+ ([1](https://nvidia.custhelp.com/app/answers/detail/a_id/4777/~/nvidia-dch%2Fstandard-display-drivers-for-windows-10-faq))

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

<h2 id="configure-nvidia-control-panel">3. Configure NVIDIA Control Panel <a href="#configure-nvidia-control-panel">(permalink)</a></h2>

<h3 id="manage-3d-settings">3.1. Manage 3D Settings <a href="#manage-3d-settings">(permalink)</a></h3>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](/README.md#benchmarking)).

- Low Latency Mode - On

  - If you leave both NVIDIA Reflex LLM and LLM in the driver on, NVIDIA Reflex LLM will take higher priority automatically ([1](https://www.nvidia.com/en-gb/geforce/news/reflex-low-latency-platform))

- Power management mode - Prefer maximum performance

- Shader Cache Size - Unlimited

- Texture filtering - Quality - High performance

- Threaded Optimization - offloads GPU-related processing tasks on the CPU ([1](https://tweakguides.pcgamingwiki.com/NVFORCE_8.html)). It may harm frame pacing as it takes CPU time away from your real-time application but you should benchmark nonetheless. You should also determine whether you are already CPU bottlenecked if you do choose to enable the setting

- Ensure that settings aren't being overridden for programs in the ``Program Settings`` tab, such as Image Sharpening for some EAC games to prevent unexpected results

<h3 id="change-resolution">3.2. Change Resolution <a href="#change-resolution">(permalink)</a></h3>

- Output dynamic range - Full

<h3 id="adjust-video-color-settings">3.3. Adjust Video Color Settings <a href="#adjust-video-color-settings">(permalink)</a></h3>

- Dynamic range - Full

<h2 id="lock-gpu-clocksp-state-0">3.4. Lock GPU Clocks/P-State 0 <a href="#lock-gpu-clocksp-state-0">(permalink)</a></h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](/README.md#benchmarking)).

Force P-State 0 with the [registry key](https://github.com/djdallmann/GamingPCSetup/blob/master/CONTENT/RESEARCH/WINDRIVERS/README.md#q-is-there-a-registry-setting-that-can-force-your-display-adapter-to-remain-at-its-highest-performance-state-pstate-p0) below (reboot required) and/or with [this method to minimize clock fluctuation](https://docs.google.com/document/d/14ma-_Os3rNzio85yBemD-YSpF_1z75mZJz1UdzmW8GE/edit). This mitigates the undesirable delay to execute new instructions when the unit enters a deeper power-saving state at the expense of higher idle temperatures and power consumption.

With the registry key below, on some GPUs the clock frequency may exceed what you have set by a small margin. Ensure to adjust the configured accordingly if applicable to avoid instability. Ensure to change the driver key to the one that corresponds to the correct NVIDIA GPU ([example](/assets/images/find-driver-key-example.png)).

```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
```

<h2 id="configure-nvidia-inspector">3.5. Configure NVIDIA Inspector <a href="#configure-nvidia-inspector">(permalink)</a></h2>

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](/README.md#benchmarking)).

- Download and extract [NVIDIA Profile Inspector](https://github.com/Orbmu2k/nvidiaProfileInspector)

- Disable ``Enable Ansel`` as it is injected in all games by the display drivers, regardless if the game supports Ansel or not which may cause conflicts with third-party tools or injectors ([1](https://www.pcgamingwiki.com/wiki/Nvidia#Ansel))

- If you have Resizable BAR set up properly, you can experiment with forcing it on unsupported games for a potential performance improvement by toggling the options below ([1](https://www.youtube.com/watch?v=ZTOtqWTFSK8)). It is worth noting that ReBAR can result in a performance regression in some games ([1](https://www.techspot.com/review/2234-nvidia-resizable-bar)) so carry out your own benchmarks

  - rBAR - Feature
  - rBAR - Options
  - rBAR - Size Limit

- Disable ``CUDA - Force P2 State`` to prevent the memory clock frequency from downclocking during CUDA workloads as it enters P-State 2 despite following the steps in the [Lock GPU Clocks/P-State 0](#lock-gpu-clocksp-state-0) section ([1](/assets/images/cuda-force-p2-state-analysis.png))
