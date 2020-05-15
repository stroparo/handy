@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals fs-agnostic

set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

rem set BROWSERPATH=%PROG%\"Mozilla Firefox"\firefox.exe
set BROWSERPATH=%PROG32%\Google\Chrome\Application\chrome.exe

:: Addons paths
set LDGRATEMONEXE=LRM.exe
set LDGRATEMONPATH=%PROG32%\"Landing Rate Monitor"\LRM.exe
set LNAVMAPEXE=littlenavmap.exe
set LNAVMAPPATH=%USERPROFILE%\opt\"Little Navmap"\littlenavmap.exe

:: Services
set FSIMLINKS=file:///C:/Users/user/workspace/links/fsim.md
set AISBRCHARTS=http://www.aisweb.aer.mil.br/geoaisweb/#
set FSHUB=https://fshub.io/pilot/2560/flights
set IVAOEYE=https://webeye.ivao.aero/
set LOGBOOK=https://docs.google.com/spreadsheets/d/1aEVHV2ZuBDwU4haMIG-_B91Xr2KMn0edOoj_ieP6RP0/edit#gid=0

:: Virtual airline
set ACARSEXE=smartCARS.exe
set ACARSDIR=%PROG32%\smartCARS\982\en-US
set ACARSPATH=%ACARSDIR%\smartCARS.exe
set WEBJETURL=http://webjetvirtual.com.br/ods/index.php/profile

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals fs-dependent

:: Flightsim
set FSEXECBASENAME=fsx.exe
set FSSTEAMID=steam://rungameid/314160

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Execute


:: FSX needs Scenery.CFG in its root but also ProgramData and ScenConfEditor only saves one place (FSX only copies when new)
rem robocopy %PROG32%\"Steam\steamapps\common\FSX" "C:\ProgramData\Microsoft\FSX" Scenery.CFG
del "C:\ProgramData\Microsoft\FSX\Scenery.CFG"

if exist %BROWSERPATH% start /max %BROWSERPATH% %FSIMLINKS% %IVAOEYE% %WEBJETURL%
rem if exist %BROWSERPATH% start /max %BROWSERPATH% %FSIMLINKS% %IVAOEYE% %WEBJETURL% %AISBRCHARTS% %FSHUB% %LOGBOOK%

tasklist | findstr %FSEXECBASENAME% || start %FSSTEAMID%

:: Addons fs-agnostic
tasklist | findstr %LNAVMAPEXE% || if exist %LNAVMAPPATH% start /max %LNAVMAPPATH%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Execute post-fs-load

timeout 4

:: Addons fs-agnostic
tasklist | findstr %LDGRATEMONEXE% || if exist %LDGRATEMONPATH% start %LDGRATEMONPATH%

:: Addons fs-dependent
set ASEXE=ASNext.exe
set ASSTEAMID=steam://rungameid/369140
tasklist | findstr %ASEXE% || start %ASSTEAMID%

:: Virtual airline
cd %ACARSDIR%
tasklist | findstr %ACARSEXE% || if exist %ACARSPATH% start %ACARSPATH%

