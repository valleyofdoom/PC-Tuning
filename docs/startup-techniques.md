# Startup Techniques

This document outlines various techniques to start applications when Windows boots that are compatible with both [User Account Control (UAC)](https://learn.microsoft.com/en-us/windows/security/application-security/application-control/user-account-control/how-it-works#the-uac-user-experience) enabled and disabled.

## 1. Table of Contents

- []()

## 2. Task Scheduler

Task Scheduler can be used to run programs and scripts with or without administrator privileges at startup given that you don't disable the Task Scheduler service.

## 3. shell:startup

## 3. Custom Script

## 2. Usage

1. Save the script below somewhere safe such as ``C:\startup.bat``

    ```bat
    @echo off
    :: request administrator privileges
    DISM >nul 2>&1 || (
        PowerShell Start -Verb RunAs '%0' 2> nul || (
            echo error: right-click on the "%~f0" script and select "Run as administrator"
            pause
        )
        exit /b 1
    )

    :: start applications
    ```

2. Type ``shell:startup`` in ``Win+R`` and create a shortcut to the script. Optionally set the ``Run`` property on the shortcut to ``Minimized``, however I don't recommend doing this as you won't be able to catch potential errors in the console

3. Under the *start applications* comment, use the command ``start /b "" <file_path> <args>`` to start applications. For future reference, keep appending to this script to start applications at startup

    - As a random example, appending ``start /b "" C:\Windows\notepad.exe`` to this script will start notepad each time the system starts

    - If the path contains white spaces, ensure to surround it with quotes

    - For PowerShell commands and scripts, use ``PowerShell "<command>"`` or ``PowerShell "<script_path>"``

4. Verify whether the applications start at startup after restarting the system in case of unexpected behavior

## Why a Script?

The script above is compatible with configurations that either have UAC enabled or disabled. See the notes below.

- When UAC is enabled and an application that requests a higher execution level is placed in ``shell:startup``, Windows simply does not start the application. The UAC prompt does not even pop up so the application will never start. The script above requests elevation at runtime which circumvents this.

- Task Scheduler can be used to start applications at startup with administrator privileges silently but is excluded as a technique as the service may be disabled in the [Configure Services and Drivers](/docs/post-install.md#configure-services-and-drivers) section
