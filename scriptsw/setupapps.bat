@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

set CWD=%~dp0
set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

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


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: started setting up applications ...

echo setupapps: basic packages ...
%PKGNINITE%\"Ninite 7Zip Installer.exe"

%COMSPEC% /c %PKGOPT%\0deploy.bat
if %computername% == QUINDIM goto :skipquindoptdev
%COMSPEC% /c %PKGDEVEL%\0zips2myopt.bat
:skipquindoptdev

:: Ninite application selections:
%PKGMAINT%\"Ninite 7Zip KLite Codecs WinDirStat WinMerge Installer.exe"
if %computername% == QUINDIM goto :niniquind
if %computername% == RAMBO goto :ninirambo
goto :niniend

:niniquind
%PKGNINITE%\"Ninite Everything Installer.exe"
%PKGNINITE%\"Ninite Launchy Installer.exe"
%PKGNINITE%\"Ninite LibreOffice Installer.exe"
%PKGNINITE%\ninite-java8.exe
goto :niniend

:ninirambo
%PKGMAINT%\"Ninite Discord Skype Zoom Installer.exe"
%PKGMAINT%\"Ninite Dropbox Google Backup and Sync qBittorrent Installer.exe"
%PKGNINITE%\ninite-java8.exe
if not exist %PROG32%\Steam                     %PKGNINITE%\"Ninite Steam Installer.exe"
goto :niniend

:niniend

if not exist %PROG32%\Auslogics\"Duplicate File Finder"     %PKGMAINT%\duplicate-file-finder-setup.exe /silent
if not exist "%ProgramFiles%"\Defraggler        %PKGMAINT%\dfsetup222.exe /silent
if not exist "%ProgramFiles%"\Eraser            %PKGMAINT%\eraser-5.8.8.exe /silent
if not exist %PROG32%\GPU-Z                     %PKGMAINT%\GPU-Z.2.21.0.exe
if not exist %PROG32%\No-IP                     %PKGMAINT%\net-noip-DUCSetup_v4_1_1.exe
if not exist "%ProgramFiles%"\Notepad2          %PKGMAINT%\notepad2x64.exe
if not exist "%ProgramFiles%"\"Path Copy Copy"  %PKGMAINT%\pathcopy.exe /silent
rem if not exist "%ProgramFiles%"\"S3 Browser"      %PKGMISC%\s3browser-9-1-3.exe
if not exist "%ProgramFiles%"\TrueCrypt         %PKGMAINT%\truecrypt-7.1a-setup.exe
rem if not exist "%ProgramFiles%"\VeraCrypt         %PKGEXTRA%\veracrypt-1.24-Update7-setup.exe

:: TODO update as in the calls conditioned on the tests above
rem %PKGEXTRA%\Linux_Reader.exe
rem %PKGMAINT%\ExplorerSuite.exe /silent
rem %PKGEXTRA%\PortableGit-2.28.0-64-bit.7z.exe
rem %PKGEXTRA%\VPN_Unlimited_v7.4.exe /SP- /VERYSILENT /NORESTART

:: Macrium FS backup
if not exist "%ProgramFiles%"\Macrium Z:\pkgs-4windows-registered\macrium-free.exe
if not exist "%ProgramFiles%"\Macrium if exist N:\sp--pkgs\macrium-free.exe N:\sp--pkgs\macrium-free.exe
if not exist "%ProgramFiles%"\Macrium if exist O:\sp--pkgs\macrium-free.exe O:\sp--pkgs\macrium-free.exe


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: started setting up devel applications ...

:: TODO review if condition test paths:
if %computername% == QUINDIM goto :skipquinddev
if not exist "%ProgramFiles%"\Git               %PKGMAINT%\Git-2.31.1-64-bit.exe
if not exist "%ProgramFiles%"\Meld              %PKGMAINT%\meld-3.20.2-mingw.msi /passive
:skipquinddev
