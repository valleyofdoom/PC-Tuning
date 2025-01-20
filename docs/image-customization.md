<h1 id="image-customization">Image Customization <a href="#image-customization">(permalink)</a></h1>

<h2 id="table-of-contents">1. Table of Contents <a href="#table-of-contents">(permalink)</a></h2>

- [1. Table of Contents](#table-of-contents)
- [2. Requirements](#requirements)
- [3. Preparing the Build Environment](#preparing-the-build-environment)
- [4. Removing Non-Essential Editions](#removing-non-essential-editions)
- [5. Mounting the ISO](#mounting-the-iso)
- [6. Integrating Drivers](#integrating-drivers)
- [7. Integrating Updates](#integrating-updates)
- [8. Enabling .NET 3.5 (Windows 8+)](#enabling-net-35-windows-8)
- [9. Modifying ISO Contents](#modifying-iso-contents)
- [10. Unmounting and Saving Changes](#unmounting-and-saving-changes)
- [11. ISO Compression](#iso-compression)
- [12. Convert to ISO](#convert-to-iso)

<h2 id="requirements">2. Requirements <a href="#requirements">(permalink)</a></h2>

- Extraction tool - [7-Zip](https://www.7-zip.org) is recommended

- [Windows ADK](https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install) - Install Deployment Tools

<h2 id="preparing-the-build-environment">3. Preparing the Build Environment <a href="#preparing-the-build-environment">(permalink)</a></h2>

- If Windows Defender is enabled, then consider disabling real-time protection as it can slow the mounting and unmounting process or cause issues in some cases

- Open CMD as administrator and do not close the window as we will be setting temporary environment variables which will be unbound when the session is ended

- Run the command below. If an error occurs, re-open CMD with administrator privileges however if nothing is shown in the output, continue to the next point

    ```bat
    DISM > nul 2>&1 || echo error: administrator privileges required
    ```

- Extract the contents of the ISO to a directory of your choice then assign it to the ``EXTRACTED_ISO`` variable. In the examples below, I'm using ``C:\en_windows_7_professional_with_sp1_x64_dvd_u_676939``

    ```bat
    set "EXTRACTED_ISO=C:\en_windows_7_professional_with_sp1_x64_dvd_u_676939"
    ```

- Set the path where the ISO will be mounted for servicing to the ``MOUNT_DIR`` variable. Changing the value below isn't necessary

    ```bat
    set "MOUNT_DIR=%temp%\MOUNT_DIR"
    ```

- Set the path to the ``oscdimg.exe`` binary to the ``OSCDIMG`` variable. Unless you installed deployment tools to a location other than the default, changing the value below isn't necessary

    ```bat
    set "OSCDIMG=C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe"
    ```

- Prepare the ``MOUNT_DIR`` directory for mounting

    ```bat
    > nul 2>&1 (DISM /Unmount-Wim /MountDir:"%MOUNT_DIR%" /Discard & rd /s /q "%MOUNT_DIR%" & mkdir "%MOUNT_DIR%")
    ```

- If the environment variables are configured correctly, the commands below should all display ``true``

    ```bat
    if exist "%EXTRACTED_ISO%\sources\install.wim" (echo true) else (echo false)
    ```

    ```bat
    if exist "%MOUNT_DIR%" (echo true) else (echo false)
    ```

    ```bat
    if exist "%OSCDIMG%" (echo true) else (echo false)
    ```

<h2 id="removing-non-essential-editions">4. Removing Non-Essential Editions <a href="#removing-non-essential-editions">(permalink)</a></h2>

Remove every edition except the desired edition by retrieving the indexes of every other edition and removing them with the commands below. Once completed, the only edition to exist should be the desired edition at index 1.

- Get all available editions and their corresponding indexes

    ```bat
    DISM /Get-WimInfo /WimFile:"%EXTRACTED_ISO%\sources\install.wim"
    ```

- Remove edition by index. Replace ``<index>`` with the index number

    ```bat
    DISM /Delete-Image /ImageFile:"%EXTRACTED_ISO%\sources\install.wim" /Index:<index>
    ```

<h2 id="mounting-the-iso">5. Mounting the ISO <a href="#mounting-the-iso">(permalink)</a></h2>

Mount the ISO with the command below.

```bat
DISM /Mount-Wim /WimFile:"%EXTRACTED_ISO%\sources\install.wim" /Index:1 /MountDir:"%MOUNT_DIR%"
```

<h2 id="integrating-drivers">6. Integrating Drivers <a href="#integrating-drivers">(permalink)</a></h2>

Place all the drivers that you want to integrate (if any) in a folder such as ``C:\drivers`` and use the command below to integrate them into the mounted ISO.

```bat
DISM /Image:"%MOUNT_DIR%" /Add-Driver /Driver:"C:\drivers" /Recurse /ForceUnsigned
```

<h2 id="integrating-updates">7. Integrating Updates <a href="#integrating-updates">(permalink)</a></h2>

Integrate the updates into the mounted ISO with the command below. The servicing stack must be installed before installing any cumulative updates.

```bat
DISM /Image:"%MOUNT_DIR%" /Add-Package /PackagePath=<path\to\update>
```

<h2 id="enabling-net-35-windows-8">8. Enabling .NET 3.5 (Windows 8+) <a href="#enabling-net-35-windows-8">(permalink)</a></h2>

.NET 3.5 can be enabled using the command below which a minority of applications depend on.

```bat
DISM /Image:"%MOUNT_DIR%" /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:"%EXTRACTED_ISO%\sources\sxs"
```

<h2 id="modifying-iso-contents">9. Modifying ISO Contents <a href="#modifying-iso-contents">(permalink)</a></h2>

To modify the ISO contents, the directory can be opened with the command below.

```bat
explorer "%MOUNT_DIR%"
```

<h2 id="unmounting-and-saving-changes">10. Unmounting and Saving Changes <a href="#unmounting-and-saving-changes">(permalink)</a></h2>

Run the command below to commit our changes to the ISO. If you get an error, check if the directory is empty to ensure the ISO is unmounted by typing ``explorer "%MOUNT_DIR%"``. If it is empty, you can likely ignore the error, otherwise try closing all open folders and running the command again.

```bat
DISM /Unmount-Wim /MountDir:"%MOUNT_DIR%" /Commit && rd /s /q "%MOUNT_DIR%"
```

<h2 id="iso-compression">11. ISO Compression <a href="#iso-compression">(permalink)</a></h2>

Compressing has no advantage other than reducing the size. Keep in mind that Windows setup must decompress the ISO upon installation which takes time. Use the command below to compress the ISO.

```bat
DISM /Export-Image /SourceImageFile:"%EXTRACTED_ISO%\sources\install.wim" /SourceIndex:1 /DestinationImageFile:"%EXTRACTED_ISO%\sources\install.esd" /Compress:recovery /CheckIntegrity && del /f /q "%EXTRACTED_ISO%\sources\install.wim"
```

<h2 id="convert-to-iso">12. Convert to ISO <a href="#convert-to-iso">(permalink)</a></h2>

Use the command below to pack the extracted contents back to a single ISO which will be created in the ``C:`` drive.

```bat
"%OSCDIMG%" -m -o -u2 -udfver102 -l"Final" -bootdata:2#p0,e,b"%EXTRACTED_ISO%\boot\etfsboot.com"#pEF,e,b"%EXTRACTED_ISO%\efi\microsoft\boot\efisys.bin" "%EXTRACTED_ISO%" "C:\Final.iso"
```
