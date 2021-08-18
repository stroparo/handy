@echo off

set DATA_PATH=K:


:: Mount encrypted partition:
:loopstart
if exist Z:\ goto :loopend
echo Waiting for Z:\ to be mounted...
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%DATA_PATH%\z.tc" /l z /q
rem "C:\Program Files\VeraCrypt\VeraCrypt.exe" /v "%DATA_PATH%\z.hc" /l z /q
timeout 1
goto :loopstart
:loopend


:: Mount external encrypted partition:
set KEYF_XENC=Z:\handys\conf\crypt-keyfiles\swordfish
if not exist %KEYF_XENC% goto :nokeyfx

if not exist I:\xpart.tc goto :noxati
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "I:\xpart.tc" /l x /q /k %KEYF_XENC%
:noxati

if not exist J:\xpart.tc goto :noxatj
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "J:\xpart.tc" /l y /q /k %KEYF_XENC%
:noxatj

:nokeyfx


if exist %USERPROFILE%\Desktop\handy\scriptsw\boot.bat start %COMSPEC% /C %USERPROFILE%\Desktop\handy\scriptsw\boot.bat
if not exist %USERPROFILE%\Desktop\handy\scriptsw\boot.bat start %COMSPEC% /C Z:\workspace\handy\scriptsw\boot.bat
exit
