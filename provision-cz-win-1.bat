@echo off

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
echo CWD=%CWD%
echo SCRIPTSW=%SCRIPTSW%

set CRYPT_FILE_BASENAME=zz.hc
if not exist "%STDIRDATA%" set STDIRDATA=K:
if not exist "%STDIRDATA%" if exist D:\%CRYPT_FILE_BASENAME% set STDIRDATA=D:\
if not exist "%STDIRDATA%" if exist E:\%CRYPT_FILE_BASENAME% set STDIRDATA=E:\
if not exist "%STDIRDATA%" if exist F:\%CRYPT_FILE_BASENAME% set STDIRDATA=F:\
if not exist "%STDIRDATA%" if exist I:\%CRYPT_FILE_BASENAME% set STDIRDATA=I:\
if not exist "%STDIRDATA%" if exist J:\%CRYPT_FILE_BASENAME% set STDIRDATA=J:\

set PKGWIN=Z:\datacsyn\pkgs-4windows
if not exist "%PKGWIN%" if exist D:\sp--pkgs\pkgs-4windows set PKGWIN=D:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist E:\sp--pkgs\pkgs-4windows set PKGWIN=E:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist F:\sp--pkgs\pkgs-4windows set PKGWIN=F:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist G:\sp--pkgs\pkgs-4windows set PKGWIN=G:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist H:\sp--pkgs\pkgs-4windows set PKGWIN=H:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist I:\sp--pkgs\pkgs-4windows set PKGWIN=I:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist J:\sp--pkgs\pkgs-4windows set PKGWIN=J:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist X:\pkgs-4windows set PKGWIN=X:\pkgs-4windows
if not exist "%PKGWIN%" if exist Y:\pkgs-4windows set PKGWIN=Y:\pkgs-4windows
set PKGMAINT=%PKGWIN%\maint
set PKGMAINTMISC=%PKGWIN%\maint\misc

rem set PAROOT=Z:\PortableApps
rem set SEVENFM=%PAROOT%\7-ZipPortable\App\7-Zip\7zFM.exe

set BASENAMENVIDIA=NVCleanstall.exe
set BASENAMEDRIVERSDIR=dataxcstm\pkgs-drivers


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Setting up environment: globals

call %SCRIPTSW%\setupenv.bat


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Copy maintenance assets to the Desktop directory ...

md %USERPROFILE%\Desktop\handy
md %USERPROFILE%\Desktop\maint
robocopy %CWD% %USERPROFILE%\Desktop\handy * /E
robocopy %PKGMAINT% %USERPROFILE%\Desktop\maint * /E


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Setting applications up ...

%COMSPEC% /c %SCRIPTSW%\setupapps.bat
@echo provision-cz-win: checkpoint for setupapps.bat
pause


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Setting up drivers for the 'rambo' host ...

if not %computername% == RAMBO goto :notrambo

if exist "%PROG%\NVIDIA" goto :oknvidia
if exist "%PROG%\NVIDIA Corporation" goto :oknvidia
if exist "%PROG32%\NVIDIA Corporation" goto :oknvidia
if exist "%PROGRAMDATA%\NVIDIA" goto :oknvidia
if exist "%PROGRAMDATA%\NVIDIA Corporation" goto :oknvidia
if exist %PKGMAINTMISC%\%BASENAMENVIDIA% %PKGMAINTMISC%\%BASENAMENVIDIA%
:oknvidia

:: Explorer at drivers packages directory
if exist "D:\%BASENAMEDRIVERSDIR%" explorer "D:\%BASENAMEDRIVERSDIR%"
if exist "E:\%BASENAMEDRIVERSDIR%" explorer "E:\%BASENAMEDRIVERSDIR%"
if exist "F:\%BASENAMEDRIVERSDIR%" explorer "F:\%BASENAMEDRIVERSDIR%"
if exist "H:\%BASENAMEDRIVERSDIR%" explorer "H:\%BASENAMEDRIVERSDIR%"
if exist "I:\%BASENAMEDRIVERSDIR%" explorer "I:\%BASENAMEDRIVERSDIR%"
if exist "J:\%BASENAMEDRIVERSDIR%" explorer "J:\%BASENAMEDRIVERSDIR%"
if exist "T:\%BASENAMEDRIVERSDIR%" explorer "T:\%BASENAMEDRIVERSDIR%"
@echo
@echo provision-cz-win: Install drivers in the explorer window just opened, if any...
pause

:notrambo


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: TODO implement devel packages installation

goto :endenvpackages
:endenvpackages


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Mounting encrypted partition ...

:begincryptcreate
if exist %STDIRDATA%\%CRYPT_FILE_BASENAME% goto :okcryptcreate
echo provision-cz-win: Waiting for %STDIRDATA%\%CRYPT_FILE_BASENAME% to be created...
rem "C:\Program Files\TrueCrypt\TrueCrypt.exe"
"C:\Program Files\VeraCrypt\VeraCrypt.exe"
timeout 30
goto :begincryptcreate
:okcryptcreate

:begincrypt
if exist Z:\ goto :okcrypt
echo provision-cz-win: Waiting for Z:\ to be mounted...
rem "C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%STDIRDATA%\%CRYPT_FILE_BASENAME%" /l z /q /e
rem "C:\Program Files\VeraCrypt\VeraCrypt.exe" /tc /v "%STDIRDATA%\%CRYPT_FILE_BASENAME%" /l z /q /e
"C:\Program Files\VeraCrypt\VeraCrypt.exe" /v "%STDIRDATA%\%CRYPT_FILE_BASENAME%" /l z /q /e
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

  echo provision-cz-win: regedit importing  %PKGWINREG%\antivirus-disable.reg
  regedit /S                                %PKGWINREG%\antivirus-disable.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\associate-magnet-to-qbittorrent.reg
  regedit /S                                %PKGWINREG%\associate-magnet-to-qbittorrent.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\explorer-show-extensions.reg
  regedit /S                                %PKGWINREG%\explorer-show-extensions.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\explorer-show-files.reg
  regedit /S                                %PKGWINREG%\explorer-show-files.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10-driver-update-disable.reg
  regedit /S                                %PKGWINREG%\w10-driver-update-disable.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10-keyb-disable-preload-layout-autoadd-bugfix.reg
  regedit /S                                %PKGWINREG%\w10-keyb-disable-preload-layout-autoadd-bugfix.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10-lockscreen-disable.reg
  regedit /S                                %PKGWINREG%\w10-lockscreen-disable.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10-login-nonblurred.reg
  regedit /S                                %PKGWINREG%\w10-login-nonblurred.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10-time-hardware-clock-as-utc.reg
  regedit /S                                %PKGWINREG%\w10-time-hardware-clock-as-utc.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10h-update-disable-noauto.reg
  regedit /S                                %PKGWINREG%\w10h-update-disable-noauto.reg
)
rem if exist %PKGWINREGETC% (
rem   echo provision-cz-win: regedit importing  %PKGWINREGETC%\explorer-checkboxes.reg
rem   regedit /S                                %PKGWINREGETC%\explorer-checkboxes.reg
rem )

@echo
@echo provision-cz-win: Select and import registry entries by running .bat's as admin in the explorer window just opened...
explorer "%PKGWINREG%"
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
