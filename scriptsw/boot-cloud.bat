@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

:: Office
set EVNTPATH=%PROG32%\Evernote\Evernote\Evernote.exe

:: Web - Cloud
set DROPBOXPATH=%PROG32%\Dropbox\Client\Dropbox.exe
set GDRIVEPATH=%PROG%\Google\Drive\googledrivesync.exe
set ONEDRIVEPATH=%LOCALAPPDATA%\Microsoft\OneDrive\OneDrive.exe
set PCLOUDPATH=%PROG%\"pCloud Drive"\pCloud.exe

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Execute

:: Office
tasklist | findstr Evernote.exe || if exist %EVNTPATH% start /max %EVNTPATH%

:: Web - Cloud
tasklist | findstr Dropbox.exe || if exist %DROPBOXPATH% start %DROPBOXPATH%
tasklist | findstr googledrive || if exist %GDRIVEPATH% start %GDRIVEPATH%
rem tasklist | findstr OneDrive.exe || if exist %ONEDRIVEPATH% start %ONEDRIVEPATH%
tasklist | findstr pCloud.exe || if exist %PCLOUDPATH% start %PCLOUDPATH%
