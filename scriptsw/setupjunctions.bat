:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals local script

if "%ST_DATA_PATH%\" == "\" set ST_DATA_PATH=K:
if "%MYOPT%" == "" set MYOPT=%ST_DATA_PATH%\opt

set JUNCTION_PATH=%ST_DATA_PATH%\opt\junction\junction.exe

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
