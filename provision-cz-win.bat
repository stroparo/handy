@echo off
@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals local script

set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

set CRYPT_FILE_BASENAME=z.tc
if not exist "%ST_DATA_PATH%" set ST_DATA_PATH=K:
if not exist "%ST_DATA_PATH%" if exist D:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=D:\
if not exist "%ST_DATA_PATH%" if exist E:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=E:\
if not exist "%ST_DATA_PATH%" if exist F:\%CRYPT_FILE_BASENAME% set ST_DATA_PATH=F:\

set PKGWIN=S:\cs-rambo\onedrive\pkgs-4windows
if exist D:\pkgs-4windows set PKGWIN=D:\pkgs-4windows
if exist E:\pkgs-4windows set PKGWIN=E:\pkgs-4windows
if exist F:\pkgs-4windows set PKGWIN=F:\pkgs-4windows
if exist L:\pkgs-4windows set PKGWIN=L:\pkgs-4windows
if exist M:\pkgs-4windows set PKGWIN=M:\pkgs-4windows
if exist K:\OneDrive\pkgs-4windows set PKGWIN=K:\OneDrive\pkgs-4windows
if exist C:\Users\user\OneDrive\pkgs-4windows set PKGWIN=C:\Users\user\OneDrive\pkgs-4windows
if exist Z:\OneDrive\pkgs-4windows set PKGWIN=Z:\OneDrive\pkgs-4windows

rem set PAROOT=Z:\PortableApps
rem set SEVENFM=%PAROOT%\7-ZipPortable\App\7-Zip\7zFM.exe

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Add maint dir to the desktop

if exist %USERPROFILE%\Desktop\maint goto :okmaint
echo Copying maint directory to the desktop...
md %USERPROFILE%\Desktop\maint
copy /Y %PKGWIN%\maint\* %USERPROFILE%\Desktop\maint\
:okmaint

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Installing applications (mostly in %PKGWIN%) ...

if not exist %PROG32%\Auslogics\"Duplicate File Finder"     %PKGWIN%\duplicate-file-finder-setup.exe
if not exist "%ProgramFiles%"\Defraggler        %PKGWIN%\dfsetup222.exe
if not exist "%ProgramFiles%"\Eraser            %PKGWIN%\eraser-5.8.8.exe
if not exist %PROG32%\GPU-Z                     %PKGWIN%\GPU-Z.2.21.0.exe
if not exist %PROG32%\No-IP                     %PKGWIN%\net-noip-DUCSetup_v4_1_1.exe
if not exist "%ProgramFiles%"\Notepad2          %PKGWIN%\notepad2x64.exe
if not exist "%ProgramFiles%"\"Path Copy Copy"  %PKGWIN%\pathcopy.exe
rem if not exist "%ProgramFiles%"\"S3 Browser"      %PKGWIN%\s3browser-9-1-3.exe
if not exist "%ProgramFiles%"\TrueCrypt         %PKGWIN%\truecrypt-7.1a-setup.exe
rem if not exist "%ProgramFiles%"\VeraCrypt         %PKGWIN%\veracrypt-1.24-Update7-setup.exe
%PKGWIN%\maint\ninite-base-min.exe

:: Packages specific for RAMBO host (nitro 5 or other gamer laptop):
if not %computername% == RAMBO goto :notrambo
if not exist "%ProgramFiles%"\Macrium           S:\cs-rambo\onedrive\pkgs-licensed\fs-part-reflect-macrium-free-v7.2.4971.exe
if not exist %PROG32%\"MSI Afterburner"         S:\cs-rambo\onedrive\pkgs-4windows-drivers\MSIAfterburnerSetup462.exe
if not exist %ST_DATA_PATH%\installed\"MSI Kombustor 4 x64"     S:\cs\pkgs-4windows-big\MSI_Kombustor4_Setup_v4.1.10.0_x64.exe
%PKGWIN%\maint\ninite-base-desktop-apps.exe
%PKGWIN%\maint\ninite-base-internet-apps.exe
if not exist %PROG32%\Steam                     %PKGWIN%\maint\ninite-steam.exe
goto :endenvpackages

:notrambo

:endenvpackages

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Drivers

if not %computername% == RAMBO goto :notrambo


if exist "%PROG%\NVIDIA" goto :oknvidia
if exist "%PROG%\NVIDIA Corporation" goto :oknvidia
if exist "%PROG32%\NVIDIA Corporation" goto :oknvidia
if exist "%PROGRAMDATA%\NVIDIA" goto :oknvidia
if exist "%PROGRAMDATA%\NVIDIA Corporation" goto :oknvidia
%PKGWIN%-drivers\NVCleanstall_1.7.0.exe
:oknvidia


:notrambo

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Mount encrypted partition

:begincrypt
if exist Z:\workspace goto :okcrypt
echo Waiting for Z:\ to be mounted...
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%ST_DATA_PATH%\%CRYPT_FILE_BASENAME%" /l z /q /e
rem "C:\Program Files\VeraCrypt\VeraCrypt.exe" /tc /v "%ST_DATA_PATH%\%CRYPT_FILE_BASENAME%" /l z /q /e
timeout 1
goto :begincrypt
:okcrypt

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Environment setup (globals, directory junctions etc.)...

set HANDYDIR=S:\cs-rambo\onedrive\pkgs-4windows\maint\handy
if exist Z:\workspace\handy set HANDYDIR=Z:\workspace\handy
if exist "%HANDYDIR%" goto :okhandydir
if not exist "%HANDYDIR%" if exist D:\handy set HANDYDIR=D:\handy
if not exist "%HANDYDIR%" if exist E:\handy set HANDYDIR=E:\handy
if not exist "%HANDYDIR%" if exist F:\handy set HANDYDIR=F:\handy
if not exist "%HANDYDIR%" if exist L:\handy set HANDYDIR=L:\handy
if not exist "%HANDYDIR%" if exist M:\handy set HANDYDIR=M:\handy
if exist "%HANDYDIR%" goto :okhandydir
echo Error setting up HANDYDIR global. No directory found. Aborting!
exit 1
:okhandydir

set SETUPENV=%HANDYDIR%\scriptsw\setupenv.bat
call %SETUPENV%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Fonts installation

if exist "%LocalAppData%\MICROSOFT\Windows\Fonts\DROID SANS MONO DOTTED FOR POWERLINE.TTF" goto :okfonts
echo Installing fonts...
powershell -nologo -ExecutionPolicy Bypass -File %HANDYDIR%\fonts\fonts-install.ps1
:okfonts

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo Setting up Windows preferences via registry and startup...

copy /B /Y %HANDYDIR%\scriptsw\boot-at-z.lnk %USERPROFILE%\Desktop\
copy /B /Y %HANDYDIR%\scriptsw\boot-cloud-at-z.lnk %USERPROFILE%\Desktop\
dir %USERPROFILE%\Desktop\boot*lnk

echo regedit importing %USERPROFILE%\Desktop\maint\bootpre.reg
regedit /S %USERPROFILE%\Desktop\maint\bootpre.reg

if exist %HANDYDIR%\conf\win-registry-favs (
  :: TODO exec as admin:
  rem explorer-menu-add-sublime-myopt.bat

  echo regedit importing %HANDYDIR%\conf\win-registry-favs\antivirus-disable.reg
  regedit /S %HANDYDIR%\conf\win-registry-favs\antivirus-disable.reg
  echo regedit importing %HANDYDIR%\conf\win-registry-favs\associate-magnet-to-qbittorrent.reg
  regedit /S %HANDYDIR%\conf\win-registry-favs\associate-magnet-to-qbittorrent.reg
  echo regedit importing %HANDYDIR%\conf\win-registry-favs\explorer-show-extensions.reg
  regedit /S %HANDYDIR%\conf\win-registry-favs\explorer-show-extensions.reg
  echo regedit importing %HANDYDIR%\conf\win-registry-favs\explorer-show-files.reg
  regedit /S %HANDYDIR%\conf\win-registry-favs\explorer-show-files.reg
  echo regedit importing %HANDYDIR%\conf\win-registry-favs\w10-lockscreen-disable.reg
  regedit /S %HANDYDIR%\conf\win-registry-favs\w10-lockscreen-disable.reg
  echo regedit importing %HANDYDIR%\conf\win-registry-favs\w10-login-nonblurred.reg
  regedit /S %HANDYDIR%\conf\win-registry-favs\w10-login-nonblurred.reg
  echo regedit importing %HANDYDIR%\conf\win-registry-favs\w10-time-hardware-clock-as-utc.reg
  regedit /S %HANDYDIR%\conf\win-registry-favs\w10-time-hardware-clock-as-utc.reg
)
if exist %HANDYDIR%\conf\win-registry-other (
  echo regedit importing %HANDYDIR%\conf\win-registry-other\explorer-checkboxes.reg
  regedit /S %HANDYDIR%\conf\win-registry-other\explorer-checkboxes.reg
)

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo Setup user preferences...

intl.cpl
main.cpl
%windir%\system32\control.exe sysdm.cpl,System,3

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: TODO import .reg files

explorer "%HANDYDIR%\scriptsw"

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Execute this in Bash (e.g. in Git for Windows):
echo if cd $(cygpath '%HANDYDIR%') ; then source ./runr-provision-${RECIPE_SUFFIX:-cz}.sh ; fi
echo
rem pause
:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pause
