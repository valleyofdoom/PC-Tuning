<h1 id="configure-the-amd-driver">Configure the AMD Driver <a href="#configure-the-amd-driver">(permalink)</a></h1>

> [!IMPORTANT]
> Disclaimer: I no longer own an AMD GPU meaning this section may be incomplete/unmaintained. For this reason, you can visit the AMD GPUs section in [Calypto's Latency Guide](https://calypto.us).

> [!CAUTION]
> 📊 **Do NOT** blindly follow the recommendations in this section. **Do** benchmark the specified changes to ensure they result in positive performance scaling, as every system behaves differently and changes could unintentionally degrade performance ([instructions](/README.md#benchmarking)).

<h2 id="table-of-contents">1. Table of Contents <a href="#table-of-contents">(permalink)</a></h2>

- [1. Table of Contents](#table-of-contents)
- [2. Strip and Install the Driver](#strip-and-install-the-driver)

<h2 id="strip-and-install-the-driver">2. Strip and Install the Driver <a href="#strip-and-install-the-driver">(permalink)</a></h2>

- Download and extract the latest recommended driver from the [AMD drivers and support page](https://www.amd.com/en/support)

- Move ``Packages\Drivers\Display\XXXX_INF`` to the desktop. The folder may be named differently on other driver versions

- Open Device Manager and install the driver by right-clicking on the display adapter, then select ``Update driver`` and select the driver folder

- Extract ``XXXX_INF\ccc2_install.exe`` with 7-Zip and run ``CN\cnext\cnext64\ccc-next64.msi`` to install the Radeon software control panel

- Download [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns) and navigate to the ``Everything`` section, then disable unnecessary AMD entries such as ``AMD Crash Defender``, ``AMD External Events Utility`` (required for VRR) and more. Ensure not to disable the core kernel-mode driver or other important components
