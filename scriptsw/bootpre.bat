@echo off

set DATA_PATH=K:


:: Mount encrypted partition:
:loopstart
if exist Z:\workspace goto :loopend
echo Waiting for Z:\ to be mounted...
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "%DATA_PATH%\z.tc" /l z /q
rem "C:\Program Files\VeraCrypt\VeraCrypt.exe" /v "%DATA_PATH%\z.hc" /l z /q
timeout 1
goto :loopstart
:loopend


:: Mount external encrypted partition:
set KEYF_XENC=Z:\handys\conf\crypt-keyfiles\swordfish
if not exist %KEYF_XENC% goto :nokeyfx
if not exist S:\bakcs\csx.tc goto :nocsxwd
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "S:\bakcs\csx.tc" /l y /q /k %KEYF_XENC%
:nocsxwd
if not exist J:\csx.tc goto :noxencrypted
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "J:\csx.tc" /l x /q /k %KEYF_XENC%
:noxencrypted
:nokeyfx


start %COMSPEC% /C Z:\workspace\handy\scriptsw\boot.bat
exit
