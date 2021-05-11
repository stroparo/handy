@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

if "%ST_DATA_PATH%\" == "\" set ST_DATA_PATH=K:
if "%MYOPT%" == "" set MYOPT=%ST_DATA_PATH%\opt

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Settings up globals in userspace (SETX) ...

echo
echo MYOPT=%MYOPT%
echo ST_DATA_PATH=%ST_DATA_PATH%
echo

:: Local env globals setup (this execution env):
set DEV=Z:\workspace
set GAMESHOME=%ST_DATA_PATH%\games
set PAROOT=Z:\PortableApps
set PKGWIN=X:\pkgs-4windows
set USERTEMP=%USERPROFILE%\AppData\Local\Temp
set USERTMP=%USERPROFILE%\AppData\Local\Temp
:: Cloud:
set DROPBOXHOME="K:\Dropbox"
set GGLDRIVEHOME="Z:\gdrive"
set ONEDRIVEHOME="%USERPROFILE%\OneDrive"

:: User env globals setup (Windows userspace, permanent):
@echo on
SETX DEV "%DEV%"
SETX GAMESHOME "%ST_DATA_PATH%\games"
SETX MYOPT "%MYOPT%"
SETX PAROOT "%PAROOT%"
SETX PKGWIN "%PKGWIN%"
SETX ST_DATA_PATH "%ST_DATA_PATH%"
SETX USERTEMP "%USERTEMP%"
SETX USERTMP "%USERTMP%"
:: Cloud:
SETX DROPBOXHOME "K:\Dropbox"
SETX GGLDRIVEHOME "Z:\gdrive"
SETX ONEDRIVEHOME "%USERPROFILE%\OneDrive"
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
echo If globals have new values (e.g. pristine host) please terminate this script and rerun...
echo If globals have new values (e.g. pristine host) please terminate this script and rerun...
pause
pause
