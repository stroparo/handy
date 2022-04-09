@echo off

rem set CRYPT_PROG="C:\Program Files\TrueCrypt\TrueCrypt.exe"
rem set CRYPT_EXTENSION=tc
rem set CRYPT_OPTIONS=
set CRYPT_PROG="C:\Program Files\VeraCrypt\VeraCrypt.exe"
set CRYPT_EXTENSION=hc
rem set CRYPT_OPTIONS=/tc

set DATA_PATH=K:
set DATA_EXTRA0=C:\Users\user
set DATA_EXTRA1=J:
set DATA_EXTRA2=I:
set DATA_EXTRA3=P:


:: Mount encrypted partition:
:zzck
if exist Z:\ goto :zzend

echo Waiting for Z:\ to be mounted...

if not exist "%DATA_PATH%\zz.%CRYPT_EXTENSION%" goto :nozzatdp
%CRYPT_PROG% %CRYPT_OPTIONS% /v "%DATA_PATH%\zz.%CRYPT_EXTENSION%" /l z /q
goto :zzmount
:nozzatdp

if not exist "%DATA_EXTRA0%\zz.%CRYPT_EXTENSION%" goto :nozzatx1
%CRYPT_PROG% %CRYPT_OPTIONS% /v "%DATA_EXTRA0%\zz.%CRYPT_EXTENSION%" /l z /q
goto :zzmount
:nozzatx0

if not exist "%DATA_EXTRA1%\zz.%CRYPT_EXTENSION%" goto :nozzatx1
%CRYPT_PROG% %CRYPT_OPTIONS% /v "%DATA_EXTRA1%\zz.%CRYPT_EXTENSION%" /l z /q
goto :zzmount
:nozzatx1

if not exist "%DATA_EXTRA2%\zz.%CRYPT_EXTENSION%" goto :nozzatx2
%CRYPT_PROG% %CRYPT_OPTIONS% /v "%DATA_EXTRA2%\zz.%CRYPT_EXTENSION%" /l z /q
goto :zzmount
:nozzatx2

if not exist "%DATA_EXTRA3%\zz.%CRYPT_EXTENSION%" goto :nozzatx3
%CRYPT_PROG% %CRYPT_OPTIONS% /v "%DATA_EXTRA3%\zz.%CRYPT_EXTENSION%" /l z /q
goto :zzmount
:nozzatx3

:zzmount
timeout 2
goto :zzck
:zzend


if exist Z:\workspace\handy\scriptsw\boot.bat start %COMSPEC% /C Z:\workspace\handy\scriptsw\boot.bat
if not exist Z:\workspace\handy\scriptsw\boot.bat start %COMSPEC% /C %USERPROFILE%\Desktop\handy\scriptsw\boot.bat

if exist Z:\handys\scriptsw\bootsec.bat %COMSPEC% /c Z:\handys\scriptsw\bootsec.bat

exit
