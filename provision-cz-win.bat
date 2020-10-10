@echo off
@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals local script

set DATA_PATH=E:
if exist D:\z.hc set DATA_PATH=D:\
if exist F:\z.hc set DATA_PATH=F:\
if exist K:\z.hc set DATA_PATH=K:\

set PKGWIN=S:\pkgs-4windows
if exist D:\pkgs-4windows set PKGWIN=D:\pkgs-4windows
if exist E:\pkgs-4windows set PKGWIN=E:\pkgs-4windows
if exist F:\pkgs-4windows set PKGWIN=F:\pkgs-4windows
if exist L:\pkgs-4windows set PKGWIN=L:\pkgs-4windows
if exist Z:\OneDrive\pkgs-4windows set PKGWIN=Z:\OneDrive\pkgs-4windows

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Add maint dir to the desktop

if exist %USERPROFILE%\Desktop\maint goto :okmaint
echo Copying maint directory to the desktop...
md %USERPROFILE%\Desktop\maint
copy /Y %PKGWIN%\maint\* %USERPROFILE%\Desktop\maint\
:okmaint

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Installing packages in %PKGWIN% ...

rem if exist "C:\Program Files\VeraCrypt\VeraCrypt.exe" goto :okprogs
%PKGWIN%\disk-defrag-setup.exe
%PKGWIN%\GPU-Z.2.21.0.exe
%PKGWIN%\duplicate-file-finder-setup.exe
%PKGWIN%\eraser-5.8.8.exe
%PKGWIN%\net-noip-DUCSetup_v4_1_1.exe
%PKGWIN%\notepad2x64.exe
%PKGWIN%\pathcopy.exe
%PKGWIN%\s3browser-9-1-3.exe
%PKGWIN%\veracrypt-1.24-Update7-setup.exe
%PKGWIN%\maint\ninite-base-desktop-apps.exe
%PKGWIN%\maint\ninite-base-internet-apps.exe
%PKGWIN%\maint\ninite-steam.exe
:okprogs

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Drivers

if exist "%PROG%\NVIDIA" goto :oknvidia
if exist "%PROG%\NVIDIA Corporation" goto :oknvidia
if exist "%PROG32%\NVIDIA Corporation" goto :oknvidia
if exist "%PROGRAMDATA%\NVIDIA" goto :oknvidia
if exist "%PROGRAMDATA%\NVIDIA Corporation" goto :oknvidia
%PKGWIN%-drivers\NVCleanstall_1.7.0.exe
:oknvidia

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Mount encrypted partition

:begincrypt
if exist Z:\workspace goto :okcrypt
echo Waiting for Z:\ to be mounted...
"C:\Program Files\VeraCrypt\VeraCrypt.exe" /v "%DATA_PATH%\z.hc" /l z /q /e
timeout 1
goto :begincrypt
:okcrypt

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Environment setup (globals, directory junctions etc.)...

set HANDYDIR=S:\handy
if exist D:\handy set HANDYDIR=D:\handy
if exist E:\handy set HANDYDIR=E:\handy
if exist F:\handy set HANDYDIR=F:\handy
if exist L:\handy set HANDYDIR=L:\handy
if exist Z:\workspace\handy set HANDYDIR=Z:\workspace\handy

set SETUPENV=%HANDYDIR%\scriptsw\setupenv.bat
call %SETUPENV%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Fonts installation

if exist "%LocalAppData%\MICROSOFT\Windows\Fonts\DROID SANS MONO DOTTED FOR POWERLINE.TTF" goto :okfonts
echo Installing fonts...
%HANDYDIR%\fonts\fonts-install.ps1
:okfonts

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: TODO import .reg files

explorer "%HANDYDIR%\conf\win-registry-favs"

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Execute this in Bash (e.g. in Git for Windows):
echo if cd /z/workspace/handy ; then source ./runr-provision-${RECIPE_SUFFIX:-cz}.sh ; fi
echo
echo After that, import %USERPROFILE%\Desktop\maint\bootpre.reg
echo
rem pause
:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pause