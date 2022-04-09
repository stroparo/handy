# Windows Setup Checklist

## Applications

### Package Installers

* https://ninite.com/
* https://scoop.sh/

### Game Launchers

* https://us.shop.battle.net/
* https://epicgames.com/
* https://gog.com/

## WSL 2 installation and initial configuration

* Enable "Windows Subsytem for Linux" and "Virtual Machine Platform" in appwiz.cpl => windows features
* Install wsl_update_x64.msi from https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
  - Link obtained at https://docs.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package
* Reboot
* Command: wsl --set-default-version 2
* Command (if needed): wsl --set-version PRE_INSTALLED_DIST_NAME 2
* Command to install the default Ubuntu: wsl --install
* List available official dists: wsl -l --online
* List your local dists: wsl -l -v
* Status: wsl --status

## Windows Settings (win+I shortcut)

* DISABLE in System:
  - Display
    - Color - Night light ("luz noturna"): 9pm - 7am
    - Scale and layout
      - (Screen DPI) Change the size of text, apps, and other items
        - Advanced scaling settings
          - 21": 120
          - 24": 112
          - 27"+: 100
  - Sound - Sound Control Panel - 'Sounds' tab - Sound Sc_h_eme - No Sounds
  - Notifications & actions - all off
  - Focus assist
  - Storage Sense
  - Shared experiences (device interconnection, mobile etc.)
  - Remote Desktop

* DISABLE in Devices:
  - Typing (inking; getting to know you; etc.) - all off
  - AutoPlay

* DISABLE in Network & Internet:
  - Wi-Fi - Online Sign-Up

* DISABLE in Personalization:
  - Colors
    - Transparency effects
    - Automatically pick an accent color from my background
  - Start
    - Enable only "show app list in Start menu" and "Show recently added apps"
  - Taskbar
    - Enable only "lock", "Use small taskbar buttons", and "powershell" as default command prompt
    - Combine taskbar buttons - Never (and use the bar vertically / standing)

* DISABLE in Apps:
  - Offline Maps - Automatically update maps
  - Startup - Cortana

* SETUP in Time & Language:
  - Date & time - Set time automatically
  - Region
    - Country or region: Brazil
    - Regional format dropdown: English (United States)
  - Language
    - Install 'us-inter' us intl altgr dead keys non-official package

* DISABLE in Gaming:
  - Xbox Game Bar

* SETUP in Ease of Acess:
  - Vision
    - Display
      - Simplify and personalize Windows - all off
    - Narrator - disable toggling shortcut ("Start-up options")
  - Interaction
    - Keyboard - disable all shortcut keys to start sticky, toggle and filter keys
      - Underline access keys when available
      - Print Screen shortcut

* DISABLE in Search:
  - Permissions & History - History

* SETUP in Privacy - a ton of bullshit, go through all of it!!

* DISABLE in Update & Security:
  - Windows Update - click pause updates for 7 days several times and it will leave you alone for 1month+
  - Delivery Optimization
  - Windows Security
    - Add filtered folders, steam, epic games etc.
  - Find my device
* SETUP in Update & Security:
  - For developers
    - PowerShell
      - Enable "Change exec. policy to allow local PowerShell scripts to run without signing."

* SETUP in NON CATEGORIZED sections, find by searching:
  - Hibernation in powershell as admin: powercfg /h off
  - Sleep: no
