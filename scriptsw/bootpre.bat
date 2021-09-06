@echo off

set DATA_PATH=I:
set DATA_EXTRA1=J:
set DATA_EXTRA2=K:


:: Mount encrypted partition:
:zzck
if exist Z:\ goto :zzend

echo Waiting for Z:\ to be mounted...

if not exist "%DATA_PATH%\zz.tc" goto :nozzatdp
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%DATA_PATH%\zz.tc" /l z /q
goto :zzmount
:nozzatdp

if not exist "%DATA_EXTRA1%\zz.tc" goto :nozzatx1
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%DATA_EXTRA1%\zz.tc" /l z /q
goto :zzmount
:nozzatx1

if not exist "%DATA_EXTRA2%\zz.tc" goto :nozzatx2
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%DATA_EXTRA2%\zz.tc" /l z /q
goto :zzmount
:nozzatx2

:zzmount
timeout 2
goto :zzck
:zzend


if exist Z:\workspace\handy\scriptsw\boot.bat start %COMSPEC% /C Z:\workspace\handy\scriptsw\boot.bat
if not exist Z:\workspace\handy\scriptsw\boot.bat start %COMSPEC% /C %USERPROFILE%\Desktop\handy\scriptsw\boot.bat
exit
