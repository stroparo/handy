:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals local script

if "%ST_DATA_PATH%\" == "\" set ST_DATA_PATH=K:
if "%MYOPT%" == "" set MYOPT=%ST_DATA_PATH%\opt

set JUNCTION_PATH=%ST_DATA_PATH%\opt\junction\junction.exe

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals userspace permanent

SETX DEV Z:\workspace
SETX GAMESHOME %ST_DATA_PATH%\games
SETX MYOPT "%MYOPT%"
SETX PAROOT Z:\PortableApps
SETX PKGWIN "%USERPROFILE%\OneDrive\pkgs-4windows"
SETX ST_DATA_PATH "%ST_DATA_PATH%"
SETX USERTEMP "%USERPROFILE%\AppData\Local\Temp"
SETX USERTMP "%USERPROFILE%\AppData\Local\Temp"
:: Cloud:
SETX DROPBOXHOME "%USERPROFILE%\Dropbox"
SETX GGLDRIVEHOME "K:\gdrive"
SETX ONEDRIVEHOME "%USERPROFILE%\OneDrive"
:: PATH in userspace
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
SETX PATH "%GPATH%"

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pause
