@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Setting up system / user environment variables
call %~dp0\scriptsw\setupenv.bat

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

set CWD=%~dp0
set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

:: CWD (current working dir. based):
set PKGCONF=%CWD%\conf
set PKGFONTS=%CWD%\fonts
set PKGWINREG=%CWD%\conf\win-registry-favs
set PKGWINREGETC=%CWD%\conf\win-registry-other
set SCRIPTSW=%CWD%\scriptsw
dir %SCRIPTSW%

if not exist "%PKGWIN%" if exist A:\sp--pkgs\pkgs-4windows set PKGWIN=A:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist B:\sp--pkgs\pkgs-4windows set PKGWIN=B:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist D:\sp--pkgs\pkgs-4windows set PKGWIN=D:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist E:\sp--pkgs\pkgs-4windows set PKGWIN=E:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist F:\sp--pkgs\pkgs-4windows set PKGWIN=F:\sp--pkgs\pkgs-4windows


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Main globals:

echo CWD=%CWD%
echo PKGWIN=%PKGWIN%
echo SCRIPTSW=%SCRIPTSW%

pause

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Copy maintenance assets to the Desktop directory ...

md %USERPROFILE%\Desktop\handy
md %USERPROFILE%\Desktop\maint
robocopy %CWD% %USERPROFILE%\Desktop\handy * /E
robocopy %PKGWIN%\maint %USERPROFILE%\Desktop\maint * /E


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Setting applications up ...

%COMSPEC% /c %SCRIPTSW%\setupapps.bat
@echo provision-cz-win: checkpoint for setupapps.bat
pause


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Setting up drivers ...

explorer "%DRIVERSDIR%"
@echo
@echo provision-cz-win: Install drivers in the explorer window just opened, if any...
pause


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: TODO implement devel packages installation

goto :endenvpackages
:endenvpackages


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Mounting encrypted partition ...

:begincryptcreate
if exist %CSCRYPTFILENAME% goto :okcryptcreate
echo provision-cz-win: Waiting for %CSCRYPTFILENAME% to be created...
rem "C:\Program Files\TrueCrypt\TrueCrypt.exe"
"C:\Program Files\VeraCrypt\VeraCrypt.exe"
timeout 30
goto :begincryptcreate
:okcryptcreate

:begincrypt
if exist Z:\ goto :okcrypt
echo provision-cz-win: Waiting for Z:\ to be mounted...
rem "C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%CSCRYPTFILENAME%" /l z /q /e
rem "C:\Program Files\VeraCrypt\VeraCrypt.exe" /tc /v "%CSCRYPTFILENAME%" /l z /q /e
"C:\Program Files\VeraCrypt\VeraCrypt.exe" /v "%CSCRYPTFILENAME%" /l z /q /e
timeout 1
goto :begincrypt
:okcrypt


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem @echo provision-cz-win: Setting up environment: junctions

rem %COMSPEC% /c %SCRIPTSW%\setupjunctions.bat


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo provision-cz-win: Setting up fonts...

if exist "%LocalAppData%\MICROSOFT\Windows\Fonts\DROID SANS MONO DOTTED FOR POWERLINE.TTF" goto :okfonts
powershell -nologo -ExecutionPolicy Bypass -File %PKGFONTS%\install.ps1
:okfonts
echo provision-cz-win: Fonts installed.


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo provision-cz-win: Setting up Windows shortcut links in the Desktop ...

copy /B /Y %SCRIPTSW%\boot.lnk %USERPROFILE%\Desktop\
copy /B /Y %SCRIPTSW%\boot-cloud.lnk %USERPROFILE%\Desktop\
copy /B /Y %SCRIPTSW%\bootpre.lnk %USERPROFILE%\Desktop\
copy /B /Y %SCRIPTSW%\bootsec.lnk %USERPROFILE%\Desktop\
dir %USERPROFILE%\Desktop\boot*lnk
echo provision-cz-win: Scripts copied to %USERPROFILE%\Desktop
pause

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo provision-cz-win: Setting up system preferences and startup via registry ...

echo provision-cz-win: regedit importing  %SCRIPTSW%\bootpre.reg
regedit /S %SCRIPTSW%\bootpre.reg

if exist %PKGWINREG% (
  :: TODO exec as admin:
  rem explorer-menu-add-sublime-myopt.bat

  regedit /S                                %PKGWINREG%\antivirus-disable.reg %PKGWINREG%\associate-magnet-to-qbittorrent.reg

  rem echo provision-cz-win: regedit importing  %PKGWINREG%\antivirus-disable.reg
  rem regedit /S                                %PKGWINREG%\antivirus-disable.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\associate-magnet-to-qbittorrent.reg
  rem regedit /S                                %PKGWINREG%\associate-magnet-to-qbittorrent.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\explorer-show-extensions.reg
  rem regedit /S                                %PKGWINREG%\explorer-show-extensions.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\explorer-show-files.reg
  rem regedit /S                                %PKGWINREG%\explorer-show-files.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\w10-driver-update-disable.reg
  rem regedit /S                                %PKGWINREG%\w10-driver-update-disable.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\w10-keyb-disable-preload-layout-autoadd-bugfix.reg
  rem regedit /S                                %PKGWINREG%\w10-keyb-disable-preload-layout-autoadd-bugfix.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\w10-lockscreen-disable.reg
  rem regedit /S                                %PKGWINREG%\w10-lockscreen-disable.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\w10-login-nonblurred.reg
  rem regedit /S                                %PKGWINREG%\w10-login-nonblurred.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\w10-time-hardware-clock-as-utc.reg
  rem regedit /S                                %PKGWINREG%\w10-time-hardware-clock-as-utc.reg
  rem echo provision-cz-win: regedit importing  %PKGWINREG%\w10h-update-disable-noauto.reg
  rem regedit /S                                %PKGWINREG%\w10h-update-disable-noauto.reg
)

@echo
@echo provision-cz-win: Select and import registry entries by running .bat's as admin in the explorer window just opened...
explorer "%PKGWINREG%"
rem explorer "%PKGWINREGETC%"
pause


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo
@echo provision-cz-win: Setting up user preferences...

intl.cpl
main.cpl
%windir%\system32\control.exe sysdm.cpl,System,3

pause


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo
echo provision-cz-win: COMPLETE.
echo
echo provision-cz-win: Execute this in Bash (e.g. in Git for Windows):
echo provision-cz-win: if cd $(cygpath '%CWD%') ; then source ./runr-provision-${RECIPE_SUFFIX:-cz}.sh ; fi
echo

pause


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
