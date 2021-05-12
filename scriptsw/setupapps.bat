@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

set CWD=%~dp0
set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

set PKGWIN=H:\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist D:\sp--pkgs-4windows set PKGWIN=D:\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist E:\sp--pkgs-4windows set PKGWIN=E:\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist F:\sp--pkgs-4windows set PKGWIN=F:\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist F:\sp--pkgs-4windows set PKGWIN=G:\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist J:\sp--pkgs-4windows set PKGWIN=J:\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist O:\sp--pkgs-4windows set PKGWIN=O:\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist D:\bakcs\sp--pkgs-4windows set PKGWIN=D:\bakcs\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist E:\bakcs\sp--pkgs-4windows set PKGWIN=E:\bakcs\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist F:\bakcs\sp--pkgs-4windows set PKGWIN=F:\bakcs\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist F:\bakcs\sp--pkgs-4windows set PKGWIN=G:\bakcs\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist F:\bakcs\sp--pkgs-4windows set PKGWIN=S:\bakcs\sp--pkgs-4windows
if not exist "%PKGWIN%" if exist X:\pkgs-4windows set PKGWIN=X:\pkgs-4windows
if not exist "%PKGWIN%" if exist Y:\pkgs-4windows set PKGWIN=Y:\pkgs-4windows
set PKGAPPS=%PKGWIN%\maint\apps
set PKGDEVEL=%PKGWIN%\devel
set PKGOPT=%PKGWIN%\opt


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: started setting up applications ...

:: While installers below run, take care of these manually extracted packages:
%COMSPEC% /c %PKGOPT%\0deploy.bat
if %computername% == QUINDIM goto :skipquindoptdev
%COMSPEC% /c %PKGDEVEL%\0zips2myopt.bat
:skipquindoptdev

:: Ninite application selections:
if %computername% == RAMBO goto :skiprambonini
if not %computername% == QUINDIM goto :skipanynini
%PKGAPPS%\ninite-tha.exe
%PKGAPPS%\ninite-java8.exe
if %computername% == QUINDIM goto :skipquindnini
%PKGAPPS%\ninite-base-min.exe
%PKGAPPS%\ninite-base-desktop-apps.exe
%PKGAPPS%\ninite-base-internet-apps.exe
%PKGAPPS%\ninite-java8.exe
if not exist %PROG32%\Steam                     %PKGAPPS%\ninite-steam.exe
:skipquindnini
:skipanynini

if not exist %PROG32%\Auslogics\"Duplicate File Finder"     %PKGAPPS%\duplicate-file-finder-setup.exe /silent
if not exist "%ProgramFiles%"\Defraggler        %PKGAPPS%\dfsetup222.exe /silent
if not exist "%ProgramFiles%"\Eraser            %PKGAPPS%\eraser-5.8.8.exe /silent
if not exist %PROG32%\GPU-Z                     %PKGAPPS%\GPU-Z.2.21.0.exe
if not exist %PROG32%\No-IP                     %PKGAPPS%\net-noip-DUCSetup_v4_1_1.exe
if not exist "%ProgramFiles%"\Notepad2          %PKGAPPS%\notepad2x64.exe
if not exist "%ProgramFiles%"\"Path Copy Copy"  %PKGAPPS%\pathcopy.exe /silent
rem if not exist "%ProgramFiles%"\"S3 Browser"      %PKGAPPS%\s3browser-9-1-3.exe
if not exist "%ProgramFiles%"\TrueCrypt         %PKGAPPS%\truecrypt-7.1a-setup.exe
rem if not exist "%ProgramFiles%"\VeraCrypt         %PKGAPPS%\veracrypt-1.24-Update7-setup.exe

:: TODO update as in the calls conditioned on the tests above
rem %PKGAPPS%\Linux_Reader.exe
rem %PKGAPPS%\ExplorerSuite.exe /silent
rem %PKGAPPS%\PortableGit-2.28.0-64-bit.7z.exe
rem %PKGAPPS%\VPN_Unlimited_v7.4.exe /SP- /VERYSILENT /NORESTART

:: Macrium FS backup
if not exist "%ProgramFiles%"\Macrium if exist D:\macrium-free.exe D:\macrium-free.exe
if not exist "%ProgramFiles%"\Macrium if exist E:\macrium-free.exe E:\macrium-free.exe
if not exist "%ProgramFiles%"\Macrium if exist F:\macrium-free.exe F:\macrium-free.exe
if not exist "%ProgramFiles%"\Macrium if exist G:\macrium-free.exe G:\macrium-free.exe
if not exist "%ProgramFiles%"\Macrium if exist J:\macrium-free.exe J:\macrium-free.exe
if not exist "%ProgramFiles%"\Macrium if exist S:\macrium-free.exe S:\macrium-free.exe


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: started setting up devel applications ...

:: TODO review if condition test paths:
if %computername% == QUINDIM goto :skipquinddev
if not exist "%ProgramFiles%"\Git               %PKGDEVEL%\Git-2.31.1-64-bit.exe
if not exist "%ProgramFiles%"\Meld              %PKGDEVEL%\meld-3.20.2-mingw.msi /passive
:skipquinddev
