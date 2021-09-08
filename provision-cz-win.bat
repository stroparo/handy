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
echo SCRIPTSW=%SCRIPTSW%
dir %SCRIPTSW%

set BASENAMENVIDIA=NVCleanstall_1.9.0.exe
set BASENAMEDRIVERSDIR=baks\pkgs-drivers

set CRYPT_FILE_BASENAME=zz.tc
if not exist "%ST_DATA_PATH%" set ST_DATA_PATH=K:
if not exist "%ST_DATA_PATH%" if exist D:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=D:\
if not exist "%ST_DATA_PATH%" if exist E:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=E:\
if not exist "%ST_DATA_PATH%" if exist F:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=F:\
if not exist "%ST_DATA_PATH%" if exist G:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=G:\
if not exist "%ST_DATA_PATH%" if exist I:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=I:\
if not exist "%ST_DATA_PATH%" if exist J:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=J:\

set PKGWIN=Z:\pkgs-4windows
if not exist "%PKGWIN%" if exist D:\sp--pkgs\pkgs-4windows set PKGWIN=D:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist E:\sp--pkgs\pkgs-4windows set PKGWIN=E:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist F:\sp--pkgs\pkgs-4windows set PKGWIN=F:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist N:\sp--pkgs\pkgs-4windows set PKGWIN=J:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist O:\sp--pkgs\pkgs-4windows set PKGWIN=O:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist X:\pkgs-4windows set PKGWIN=X:\pkgs-4windows
if not exist "%PKGWIN%" if exist Y:\pkgs-4windows set PKGWIN=Y:\pkgs-4windows
set PKGDEVEL=%PKGWIN%\devel
set PKGMAINT=%PKGWIN%\maint
set PKGMISC=%PKGWIN%\maint\misc
set PKGNINITE=%PKGWIN%\maint\ninite-singletons
set PKGOPT=%PKGWIN%\opt

rem set PAROOT=Z:\PortableApps
rem set SEVENFM=%PAROOT%\7-ZipPortable\App\7-Zip\7zFM.exe


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
%PKGMAINT%\%BASENAMENVIDIA%
:oknvidia

:: Explorer at drivers packages directory
if exist D:\%BASENAMEDRIVERSDIR% explorer D:\%BASENAMEDRIVERSDIR%
if exist E:\%BASENAMEDRIVERSDIR% explorer E:\%BASENAMEDRIVERSDIR%
if exist F:\%BASENAMEDRIVERSDIR% explorer F:\%BASENAMEDRIVERSDIR%
if exist G:\%BASENAMEDRIVERSDIR% explorer G:\%BASENAMEDRIVERSDIR%
if exist I:\%BASENAMEDRIVERSDIR% explorer I:\%BASENAMEDRIVERSDIR%
if exist J:\%BASENAMEDRIVERSDIR% explorer J:\%BASENAMEDRIVERSDIR%
if exist K:\%BASENAMEDRIVERSDIR% explorer K:\%BASENAMEDRIVERSDIR%
@echo
@echo provision-cz-win: Install drivers in the explorer window just opened...
pause

:notrambo


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: TODO implement devel packages installation

goto :endenvpackages
:endenvpackages


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Mounting encrypted partition ...

:begincryptcreate
if exist %ST_DATA_PATH%\%CRYPT_FILE_BASENAME% goto :okcryptcreate
echo provision-cz-win: Waiting for %ST_DATA_PATH%\%CRYPT_FILE_BASENAME% to be created...
"C:\Program Files\TrueCrypt\TrueCrypt.exe"
rem "C:\Program Files\VeraCrypt\VeraCrypt.exe"
timeout 30
goto :begincryptcreate
:okcryptcreate

:begincrypt
if exist Z:\ goto :okcrypt
echo provision-cz-win: Waiting for Z:\ to be mounted...
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%ST_DATA_PATH%\%CRYPT_FILE_BASENAME%" /l z /q /e
rem "C:\Program Files\VeraCrypt\VeraCrypt.exe" /tc /v "%ST_DATA_PATH%\%CRYPT_FILE_BASENAME%" /l z /q /e
timeout 1
goto :begincrypt
:okcrypt


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo provision-cz-win: Setting up environment: junctions

%COMSPEC% /c %SCRIPTSW%\setupjunctions.bat


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Fonts installation

if exist "%LocalAppData%\MICROSOFT\Windows\Fonts\DROID SANS MONO DOTTED FOR POWERLINE.TTF" goto :okfonts
echo provision-cz-win: Installing fonts...
powershell -nologo -ExecutionPolicy Bypass -File %PKGFONTS%\fonts-install.ps1
:okfonts


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo provision-cz-win: Setting up Windows links and preferences (registry and startup) ...

copy /B /Y %SCRIPTSW%\boot.lnk %USERPROFILE%\Desktop\
copy /B /Y %SCRIPTSW%\boot-cloud.lnk %USERPROFILE%\Desktop\
copy /B /Y %SCRIPTSW%\bootpre.lnk %USERPROFILE%\Desktop\
dir %USERPROFILE%\Desktop\boot*lnk

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
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10-lockscreen-disable.reg
  regedit /S                                %PKGWINREG%\w10-lockscreen-disable.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10-login-nonblurred.reg
  regedit /S                                %PKGWINREG%\w10-login-nonblurred.reg
  echo provision-cz-win: regedit importing  %PKGWINREG%\w10-time-hardware-clock-as-utc.reg
  regedit /S                                %PKGWINREG%\w10-time-hardware-clock-as-utc.reg
)
if exist %PKGWINREGETC% (
  echo provision-cz-win: regedit importing  %PKGWINREGETC%\explorer-checkboxes.reg
  regedit /S                                %PKGWINREGETC%\explorer-checkboxes.reg
  echo provision-cz-win: regedit importing  %PKGWINREGETC%\w10h-disable-windows-update-noauto.reg
  regedit /S                                %PKGWINREGETC%\w10h-disable-windows-update-noauto.reg
)

@echo
@echo provision-cz-win: Select and import registry entries by running .bat's as admin in the explorer window just opened...
explorer %PKGWINREG%
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
