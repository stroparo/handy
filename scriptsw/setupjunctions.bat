@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

if "%ST_DATA_PATH%\" == "\" set ST_DATA_PATH=K:
if "%MYOPT%" == "" set MYOPT=%ST_DATA_PATH%\opt

set JUNCTION=%ST_DATA_PATH%\opt\junction\junction.exe


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo
echo Settings up junctions...

if not exist %USERPROFILE%\data %JUNCTION% %USERPROFILE%\data K:\

if not exist Z:\ exit 1
md Z:\appsw
md Z:\appsw\AppData.Local
md Z:\appsw\AppData.Roaming

explorer %AppData%
explorer %LocalAppData%
echo
echo Go review AppData directories already created in file explorer
echo ... and move pre-existing ones into the proper junction sources:
echo
echo Z:\appsw\AppData.Local
echo Z:\appsw\AppData.Roaming
echo
echo ... come back here after all directories to be junctions...
echo ... have been cleared from the AppData directories into Z:\appsw
echo ... (those already junctioned will be just ignored).
echo
pause
echo ONE MORE CONFIRMATION OF THE ABOVE WARNING...
pause

:: AppData.Local:
if not exist %LocalAppData%\Discord %JUNCTION% %LocalAppData%\Discord Z:\appsw\AppData.Local\Discord
if not exist %LocalAppData%\Dropbox %JUNCTION% %LocalAppData%\Dropbox Z:\appsw\AppData.Local\Dropbox
if not exist %LocalAppData%\KeePassXC %JUNCTION% %LocalAppData%\KeePassXC Z:\appsw\AppData.Local\KeePassXC

:: AppData.Roaming - VSCode:
if not exist %AppData%\VSCode %JUNCTION% %AppData%\VSCode Z:\appsw\AppData.Roaming\VSCode

:: Browser - Brave:
if not exist %LocalAppData%\BraveSoftware %JUNCTION% %LocalAppData%\BraveSoftware Z:\appsw\AppData.Local\BraveSoftware

:: Browser - Chrome:
if not exist %LocalAppData%\Google md %LocalAppData%\Google
if not exist %LocalAppData%\Google\Chrome %JUNCTION% %LocalAppData%\Google\Chrome Z:\appsw\AppData.Local\Google\Chrome
if not exist %LocalAppData%\Google\Drive %JUNCTION% %LocalAppData%\Google\Drive Z:\appsw\AppData.Local\Google\Drive

:: Browser - Edge:
if not exist %LocalAppData%\Microsoft md %LocalAppData%\Microsoft
if not exist %LocalAppData%\Microsoft\Edge %JUNCTION% %LocalAppData%\Microsoft\Edge Z:\appsw\AppData.Local\Microsoft\Edge

:: Etcetera:

:: Workspacee (DEV):
rem if not exist %USERPROFILE%\workspace %JUNCTION% %USERPROFILE%\workspace %DEV%

pause
