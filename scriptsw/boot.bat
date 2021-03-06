@echo off
@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

if "%ST_DATA_PATH%\" == "\" set ST_DATA_PATH=K:
if "%MYOPT%" == "" set MYOPT=%ST_DATA_PATH%\opt

:: Working dirs - workspace
set WSDIR=%DEV%
if not exist %WSDIR% set WSDIR=Z:\workspace
if not exist %WSDIR% if exist %USERPROFILE%\workspace set WSDIR=%USERPROFILE%\workspace

:: Working dirs for handy stuff:
set HANDYDIR=%WSDIR%\handy
if not exist %HANDYDIR% if exist Z:\handy set HANDYDIR=Z:\handy
set HANDYSDIR=Z:\handys

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals - Applications

:: Filesystem indexing - Everything app
set EVTH=%PROG32%\Everything\Everything.exe
set EVTHOPT=%MYOPT%\everything\Everything.exe
set EVTHOPT=%MYOPT%\everythingfu\Everything.exe

:: Launchy
set LCHY=%PROG32%\Launchy\Launchy.exe
set LCHYOPT=%MYOPT%\launchy\Launchy.exe

:: Macros
set AHKPROG=%MYOPT%\autohotkey\AutoHotkeyU64.exe
set AHK32=%MYOPT%\autohotkey\AutoHotkeyU32.exe
if not exist C:\"Program Files (x86)" set AHKPROG=%AHK32%
set AHKCO=%HANDYDIR%\conf\ahk\common.ahk
set AHKPE=%HANDYSDIR%\macros\personal.ahk
set AHKUN=%HANDYDIR%\conf\ahk\unixcommands.ahk

if not exist %AHKPROG% (goto :noahk)
tasklist | findstr AutoHotkey && goto :noahk
if exist %AHKCO% start %AHKPROG% %AHKCO%
if exist %AHKPE% start %AHKPROG% %AHKPE%
if exist %AHKUN% start %AHKPROG% %AHKUN%
:noahk

:: Office
set JOINMEPATH=%LOCALAPPDATA%\join.me\join.me.exe
set LOFFCALC=%PROG32%\"LibreOffice 5"\program\scalc.exe
set OF14PATH=%PROG%\"Microsoft Office"\Office14
set OF14EXCE=%OF14PATH%\EXCEL.EXE
set OF14OUTL=%OF14PATH%\OUTLOOK.EXE
set OF15PATH=%PROG%\"Microsoft Office"\Office15
set OF15EXCE=%OF15PATH%\excel.exe
set OF15LYNC=%OF15PATH%\lync.exe
REM set OF15OUTL=%PROG%\"Microsoft Office 15"\root\office15\OUTLOOK.EXE
set OF15OUTL=%OF15PATH%\outlook.exe
set OF16PATH=%PROG%\"Microsoft Office"\root\Office16
set OF16EXCE=%OF16PATH%\EXCEL.EXE
set OF16LYNC=%OF16PATH%\lync.exe
set OF16ONEN=%OF16PATH%\ONENOTE.exe
set OF16OUTL=%OF16PATH%\OUTLOOK.exe
set OFFTEAMS=%LOCALAPPDATA%\Microsoft\Teams\Update.exe

:: Office - Mastercard
set MCEXCEL=%OF16EXCE%
set MCLYNC=%OF16LYNC%
set MCONENOT=%OF16ONEN%
set MCOUTLOO=%OF16OUTL%

:: Sec
set MYKEEPASS=%MYOPT%\keepassxc\KeePassXC.exe
set MYPAGEANT=%MYOPT%\puttycm\putty\pageant.exe

:: Terminal emulators
set CONEMU=%MYOPT%\conemu\ConEmu64.exe
set CONEMU32=%MYOPT%\conemu\ConEmu.exe
if not exist C:\"Program Files (x86)" set CONEMU=%CONEMU32%
set MOBA=%PROG32%\Mobatek\"MobaXterm Professional Edition"\MobaXterm.exe
set MOBAINI=%USERPROFILE%\AppData\Roaming\MobaXterm\MobaXterm.ini
if exist %WSDIR%\handy-mc\conf\moba\MobaXterm.ini set MOBAINI=%WSDIR%\handy-mc\conf\moba\MobaXterm.ini

:: Tuning
set THROSTOP=%MYOPT%\throttlestop\throttlestop.exe

:: Web
set SKYPEPATH=%PROG32%\Skype\Phone\Skype.exe

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Env agnostic stuff

:: Launchy launcher
tasklist | findstr Launchy || if exist %LCHYOPT% (start %LCHYOPT%) else (if exist %LCHY% start %LCHY%)

:: Filesystem indexing - Everything app
tasklist | findstr "Everything.*Console" || if exist %EVTHOPT% (start %EVTHOPT%) else (if exist %EVTH% start %EVTH%)

:: Other macros
set AHKWPR=%HANDYSDIR%\macros\wpr.ahk
if exist %AHKPROG% if exist %AHKWPR% start %AHKPROG% %AHKWPR%

:: Sec
tasklist | findstr KeePassXC || if exist %MYKEEPASS% start /max %MYKEEPASS%

:: Terminal - ConEmu
rem cd %WSDIR%
rem tasklist | findstr ConEmu || if exist %CONEMU% start %CONEMU% -Max

:: Tuning
rem tasklist | findstr ThrottleStop || if exist %THROSTOP% (start %THROSTOP%)

timeout 4
cd %TMP%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Web browser

rem set PROG=C:\"Program Files"
rem set PROG32=C:\"Program Files (x86)"
rem if not exist %PROG32% set PROG32=%PROG%

set BRAVEPATH=%PROG%\BraveSoftware\Brave-Browser\Application\brave.exe
set CHROMEPATH=%PROG%\Google\Chrome\Application\chrome.exe
set FIREFOXPATH=%PROG%\"Mozilla Firefox"\firefox.exe

rem set BROWSEREXPR=brave
rem set BROWSERPATH=%BRAVEPATH%

set BROWSEREXPR=chrome
set BROWSERPATH=%CHROMEPATH%
set BROWSEROPTS=--profile-directory="Default"

rem set BROWSEREXPR=firefox
rem set BROWSERPATH=%FIREFOXPATH%

tasklist | findstr %BROWSEREXPR% && goto :browserrunning
rem if exist %BROWSERPATH% start /max %BROWSERPATH%
if exist %BROWSERPATH% start /max %BROWSERPATH% %BROWSEROPTS%
:browserrunning

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Env specific globals

:: Dropbox
if exist %DROPBOXHOME% goto :existsdropboxhome
if exist K:\Dropbox set DROPBOXHOME=K:\Dropbox
if exist %USERPROFILE%\Dropbox set DROPBOXHOME=%USERPROFILE%\Dropbox
if exist Z:\Dropbox set DROPBOXHOME=Z:\Dropbox
:existsdropboxhome

:: PortableApps
set PORTABLEPARENT=Z:
if not exist %PORTABLEPARENT%\PortableApps if exist %DROPBOXHOME%\PortableApps set PORTABLEPARENT=%DROPBOXHOME%
if not exist %PORTABLEPARENT%\PortableApps if exist %USERPROFILE%\PortableApps set PORTABLEPARENT=%USERPROFILE%

:: Telegram
set TGPATH=Z:\optz\Telegram\Telegram.exe
if exist %TGPATH% start %TGPATH%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Env specific startup

:: PortableApps
tasklist | findstr PortableApps || if exist %PORTABLEPARENT%\PortableApps (start %PORTABLEPARENT%\Start.exe)

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo bootstrap sequence finished
:: timeout -1
exit
