:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals local script

set DATA_PATH=K:
set JUNCTION_PATH=%DATA_PATH%\opt\junction\junction.exe
set MYOPT=%DATA_PATH%\opt

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals userspace permanent

SETX DEV Z:\workspace
SETX GAMESHOME %DATA_PATH%\games
SETX MYOPT "%MYOPT%"
SETX PKGWIN "%USERPROFILE%\OneDrive\pkgs-4windows"
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
:: Junctions

if not exist %USERPROFILE%\data %JUNCTION_PATH% %USERPROFILE%\data K:\

:: AppData:
if not exist %AppData%\VSCode %JUNCTION_PATH% %AppData%\VSCode Z:\appsw\AppData.Roaming\VSCode
if not exist %LocalAppData%\Discord %JUNCTION_PATH% %LocalAppData%\Discord Z:\appsw\AppData.Local\Discord
if not exist %LocalAppData%\Dropbox %JUNCTION_PATH% %LocalAppData%\Dropbox Z:\appsw\AppData.Local\Dropbox
if not exist %LocalAppData%\KeePassXC %JUNCTION_PATH% %LocalAppData%\KeePassXC Z:\appsw\AppData.Local\KeePassXC
if not exist %LocalAppData%\KeePassXC %JUNCTION_PATH% %LocalAppData%\KeePassXC Z:\appsw\AppData.Local\KeePassXC
:: Chrome:
if not exist %LocalAppData%\Google md %LocalAppData%\Google
if not exist %LocalAppData%\Google\Chrome %JUNCTION_PATH% %LocalAppData%\Google\Chrome Z:\appsw\AppData.Local\Google\Chrome
if not exist %LocalAppData%\Google\Drive %JUNCTION_PATH% %LocalAppData%\Google\Drive Z:\appsw\AppData.Local\Google\Drive
:: Etcetera:
if not exist %LocalAppData%\Microsoft\Edge %JUNCTION_PATH% %LocalAppData%\Microsoft\Edge Z:\appsw\AppData.Local\Microsoft\Edge
:: Workspacee (DEV):
rem if not exist %USERPROFILE%\workspace %JUNCTION_PATH% %USERPROFILE%\workspace %DEV%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pause
