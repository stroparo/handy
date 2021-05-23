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

if not exist K:\y.tc goto :noxspare
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "K:\y.tc" /l y /q /k %KEYF_XENC%
:noxspare

if not exist J:\csx.tc goto :noxmain
"C:\Program Files\TrueCrypt\TrueCrypt.exe" /v "J:\csx.tc" /l x /q /k %KEYF_XENC%
:noxmain

:nokeyfx


if exist %USERPROFILE%\Desktop\handy\scriptsw\boot.bat start %COMSPEC% /C %USERPROFILE%\Desktop\handy\scriptsw\boot.bat
if not exist %USERPROFILE%\Desktop\handy\scriptsw\boot.bat start %COMSPEC% /C Z:\workspace\handy\scriptsw\boot.bat
exit
