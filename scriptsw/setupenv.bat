@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

if "%STDIRDATA%\" == "\" set STDIRDATA=K:
if "%MYOPT%" == "" set MYOPT=%STDIRDATA%\opt
if not exist %MYOPT% md %MYOPT%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Settings up globals in userspace (SETX) ...

echo
echo MYOPT=%MYOPT%
echo STDIRDATA=%STDIRDATA%
echo

:: Local env globals setup (this execution env):
set DEV=Z:\workspace
set STDIRPROGS=O:
set STDIRSYNC=Z:\datacssync

:: Local env globals, derived from other globals:
set GAMESHOME=%STDIRDATA%\games
set PAROOT=%STDIRPROGS%\PortableApps
set PKGWIN=%STDIRSYNC%\pkgs-4windows
set USERTEMP=%USERPROFILE%\AppData\Local\Temp
set USERTMP=%USERPROFILE%\AppData\Local\Temp
:: Cloud:
set DROPBOXHOME=%STDIRDATA%\Dropbox
set GGLDRIVEHOME=G:\My Drive
set ONEDRIVEHOME=%STDIRDATA%\OneDrive

:: User env globals setup (Windows userspace, permanent):
@echo on
SETX DEV "%DEV%"
SETX GAMESHOME "%GAMESHOME%"
SETX MYOPT "%MYOPT%"
SETX PAROOT "%PAROOT%"
SETX PKGWIN "%PKGWIN%"
SETX STDIRDATA "%STDIRDATA%"
SETX USERTEMP "%USERTEMP%"
SETX USERTMP "%USERTMP%"
:: Cloud:
SETX DROPBOXHOME "%DROPBOXHOME%"
SETX GGLDRIVEHOME "%GGLDRIVEHOME%"
SETX ONEDRIVEHOME "%ONEDRIVEHOME%"
@echo off

:: PATH global:
set GPATH=%MYOPT%\ag
set GPATH=%GPATH%;%MYOPT%\clamav
set GPATH=%GPATH%;%MYOPT%\clcl
set GPATH=%GPATH%;%MYOPT%\git
set GPATH=%GPATH%;%MYOPT%\git\bin
set GPATH=%GPATH%;%MYOPT%\git\cmd
set GPATH=%GPATH%;%MYOPT%\junction
set GPATH=%GPATH%;%MYOPT%\md5deep
set GPATH=%GPATH%;%MYOPT%\nvm
rem set GPATH=%GPATH%;%MYOPT%\OpenSSH-Win64
set GPATH=%GPATH%;%MYOPT%\pstools
set GPATH=%GPATH%;%MYOPT%\sdelete
set GPATH=%GPATH%;%MYOPT%\sqlite
set GPATH=%GPATH%;%MYOPT%\subl
set GPATH=%GPATH%;%MYOPT%\apache-tomcat-7.0.99\bin
rem set GPATH=%GPATH%;%MYOPT%\eclipse
set GPATH=%GPATH%;%MYOPT%\jdk1.8.0_251\app\bin
set GPATH=%GPATH%;%MYOPT%\jdk1.8.0_251\app\jre\bin
set GPATH=%GPATH%;%MYOPT%\maven\bin
set PATH=%PATH%;%GPATH%
@echo on
SETX PATH "%GPATH%"
@echo off

echo
echo SETX (global environment variables) definitions COMPLETE.
echo
echo IMPORTANT (DOUBLE CONFIRMATION BELOW)
echo IMPORTANT (DOUBLE CONFIRMATION BELOW)
echo If globals changed (e.g. pristine host) terminate this set of scripts and rerun...
echo If globals changed (e.g. pristine host) terminate this set of scripts and rerun...
pause
pause
