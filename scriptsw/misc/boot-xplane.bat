@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals fs-agnostic

set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

set FIREFOXPATH=%PROG%\"Mozilla Firefox"\firefox.exe

:: Addons paths
set LDGRATEMONEXE=LRM.exe
set LDGRATEMONPATH=%PROG32%\"Landing Rate Monitor"\LRM.exe
set LNAVMAPEXE=littlenavmap.exe
set LNAVMAPPATH=%USERPROFILE%\opt\"Little Navmap"\littlenavmap.exe

:: Services
set AISBRCHARTS=http://www.aisweb.aer.mil.br/geoaisweb/#
set FSHUB=https://fshub.io/pilot/2560/flights
set IVAOEYE=https://webeye.ivao.aero/
set LOGBOOK=https://docs.google.com/spreadsheets/d/1aEVHV2ZuBDwU4haMIG-_B91Xr2KMn0edOoj_ieP6RP0/edit#gid=0

:: Virtual airline
set ACARSEXE=smartCARS.exe
set ACARSPATH=%PROG32%\smartCARS\982\en-US\smartCARS.exe
set WEBJETURL=http://webjetvirtual.com.br/ods/index.php/profile

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals fs-dependent

:: Flightsim
set FSEXECBASENAME=X-Plane.exe
set FSSTEAMID=steam://rungameid/269950

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Execute

tasklist | findstr %FSEXECBASENAME% || start %FSSTEAMID%

:: Addons fs-agnostic
tasklist | findstr %LNAVMAPEXE% || if exist %LNAVMAPPATH% start /max %LNAVMAPPATH%

:: Virtual airline
tasklist | findstr %ACARSEXE% || if exist %ACARSPATH% start %ACARSPATH%
if exist %FIREFOXPATH% start /max %FIREFOXPATH% %IVAOEYE% %WEBJETURL%
rem if exist %FIREFOXPATH% start /max %FIREFOXPATH% %IVAOEYE% %WEBJETURL% %AISBRCHARTS% %FSHUB% %LOGBOOK%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Execute post-fs-load

timeout 4

:: Addons fs-agnostic
tasklist | findstr %LDGRATEMONEXE% || if exist %LDGRATEMONPATH% start %LDGRATEMONPATH%
