@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

set CWD=%~dp0
set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

if not exist "%PKGWIN%" if exist A:\sp--pkgs\pkgs-4windows set PKGWIN=A:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist B:\sp--pkgs\pkgs-4windows set PKGWIN=B:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist D:\sp--pkgs\pkgs-4windows set PKGWIN=D:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist E:\sp--pkgs\pkgs-4windows set PKGWIN=E:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist F:\sp--pkgs\pkgs-4windows set PKGWIN=F:\sp--pkgs\pkgs-4windows
set PKGDEVEL=%PKGWIN%\devel
set PKGMAINT=%PKGWIN%\maint
set PKGMAINTMISC=%PKGWIN%\maint\misc
set PKGNINITE=%PKGWIN%\maint\ninite-singletons
set PKGOPT=%PKGWIN%\opt

:: Other packages:
set PKGEXTRA=%DATAXCS%\pkgs-4windows-extras
set PKGREGD=%DATAXCS%\pkgs-4windows-registered

:: Git:
set DIRGIT1=%UserProfile%\scoop\apps\git-with-openssh
set DIRGIT2=%ProgramFiles%\Git
set PKGGIT=%DATAXCSTM%\pkgs-4windows-conting\offline-installers\git.exe

:: Macrium Reflect Free image cloning:
set PKGMACRIUM=%DATAXCS%\pkgs-4windows-registered\macrium-free.exe
set PKGMACRIUMB=A:\sp--pkgs\macrium-free.exe
set PKGMACRIUMC=B:\sp--pkgs\macrium-free.exe
set PKGWSL=%DATAXCS%\pkgs-4windows-wsl-linux

:: PortableApps:
rem set PAROOT=Z:\PortableApps
rem set SEVENFM=%PAROOT%\7-ZipPortable\App\7-Zip\7zFM.exe


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: started setting up applications ...

:: Ninite automated installations:
:: Quote this ninite call command below for 7zip otherwise it oddly breaks:
rem if not exist "%ProgramFiles%"\7-Zip  "%PKGNINITE%\Ninite 7Zip Installer.exe"
%PKGMAINT%\"ninite.exe"

:: Deploy opt applications (semi-automated):
%COMSPEC% /c %PKGOPT%\0deploy.bat

:: Manual installations:
explorer %PKGMAINT%\manually-updated
explorer %PKGMAINT%\net-installers
explorer %PKGDEVEL%
explorer %PKGEXTRA%
explorer %PKGREGD%
explorer %PKGWSL%
echo Complete the manual package setups then hit ENTER to continue...
echo ...
echo ...
pause

:: Regular setups:
if not exist %PROG32%\Auslogics\"Duplicate File Finder"     %PKGMAINT%\duplicate-file-finder-setup.exe /silent
if not exist "%ProgramFiles%"\Defraggler        %PKGMAINT%\manually-updated\dfsetup.exe /silent
if not exist %PROG32%\DroidCam        			%PKGMAINT%\manually-updated\droidcam.exe
if not exist "%ProgramFiles%"\Eraser            %PKGMAINT%\eraser-5.8.8.exe /silent
if not exist %PROG32%\GPU-Z                     %PKGMAINT%\manually-updated\gpuz.exe
if not exist "%ProgramFiles%"\HWiNFO64        	%PKGMAINT%\manually-updated\hwi.exe
if not exist %PROG32%\No-IP                     %PKGMAINT%\manually-updated\noip.exe
if not exist "%ProgramFiles%"\Notepad2          %PKGMAINT%\notepad2x64.exe
if not exist "%ProgramFiles%"\"Path Copy Copy"  %PKGMAINT%\pathcopy.exe /silent
if not exist "%ProgramFiles%"\"Rapid Environment Editor"  %PKGMAINT%\manually-updated\RapidEE_setup.exe /SILENT
rem if not exist "%ProgramFiles%"\"S3 Browser"      %PKGMAINT%\manually-updated\s3browser.exe
rem if not exist "%ProgramFiles%"\TrueCrypt         %PKGMAINT%\truecrypt-7.1a-setup.exe
rem if not exist "%ProgramFiles%"\VeraCrypt         %PKGEXTRA%\veracrypt.exe
if not exist %SystemRoot%\SysWOW64\us-inter.dll  %PKGMAINT%\us-intl-altgr-dead-keys\setup.exe
if not exist %PROG32%\Wally        				%PKGMAINT%\manually-updated\wally.exe

:: TODO create calls for these, similar as the above ones:
rem %PKGEXTRA%\Linux_Reader.exe
rem %PKGMAINT%\ExplorerSuite.exe /silent
rem %PKGEXTRA%\VPN_Unlimited_v7.4.exe /SP- /VERYSILENT /NORESTART

:: Macrium FS backup
if not exist "%ProgramFiles%"\Macrium  if exist %PKGMACRIUM%  	%PKGMACRIUM%
if not exist "%ProgramFiles%"\Macrium  if exist %PKGMACRIUMB%  	%PKGMACRIUMB%
if not exist "%ProgramFiles%"\Macrium  if exist %PKGMACRIUMC% 	%PKGMACRIUMC%


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: devel applications ...

cmd /C scoop install git-with-openssh
if exist "%DIRGIT1%"  goto :gitok
if exist "%DIRGIT2%"  goto :gitok
if exist "%PKGGIT" 	"%PKGGIT"
:gitok

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pause
