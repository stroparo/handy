SetTitleMatchMode, 2 ; contain title

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; AutoHotKey
::ahkhot::https://www.autohotkey.com/docs/Hotkeys.htm
::ahkkey::https://www.autohotkey.com/docs/KeyList.htm
#z::Run www.autohotkey.com


; X-Plane mute
#c::
Run %ComSpec% /c %DEV%\handy\scriptsw\volume-mute-xplane.bat
return


; Notepad run - ctrl alt n
^!n::
IfWinExist Untitled - Notepad
    WinActivate
else
    Run Notepad
return


; Outlook move - ctrl alt shift v
#^!+v::
IfWinActive, Outlook
{
    Send {Alt down}
    Sleep, 500
    Send h
    Sleep, 500
    Send {Alt up}
    Sleep, 500
    Send mv
}
return


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Hotstring *

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Daily speech - english

::afaik::as far as I know
::tyvm::thank you very much

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Daily speech - portuguese

::bdia::bom dia, tudo bem?
::btar::boa tarde, tudo bem?
::bnoi::boa noite, tudo bem?
::tdbem::oi, tudo bem?
::tdvc::oi, tudo bem e voce?

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Common commands

; Groups must be defined at the top of the file to work
;GroupAdd, abrowser, Chrome
;GroupAdd, abrowser, Firefox
;#IfWinActive ahk_group abrowser

;#Include %A_ScriptDir%\filename.ahk

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Plugin inspection

::drget::chrome.storage.sync.get(null, (settings) => console.log(JSON.stringify(settings, null, 4)));
::drset::chrome.storage.sync.set(JSON.parse('json text here'), () => console.log(chrome.runtime.lastError || 'OK'));

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Publish Videos of Xplane 11

::xpvid::
Send, X-Plane 11 with:{Enter}
Send, - Reshade, mostly with the vibrance filter{Enter}
Send, - SFD Global{Enter}
Send, - HD Clouds{Enter}
Send, - Airport Navigator{Enter}
Send, - AviTab{Enter}
Send, - BetterPushback{Enter}
Send, - CZD throttle display{Enter}
Send, - Little Xpconnect (for Littlenavmap){Enter}
Send, - PythonScripts (for NOAA weather){Enter}
Send, - Script Baixa Renda{Enter}
Send, - Shadows fix{Enter}
Send, - TerrainRadar{Enter}
Send, - VRFS cloud shadow fix{Enter}
Send, - X-Camera{Enter}
Send, - Xchecklist{Enter}
Send, - X-IvAp (for IVAO){Enter}
Send, - XPUIPC{Enter}
Send, - X-RAAS2{Enter}
Send, - X-Visibility{Enter}
return

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Windows commands

::envvar::rundll32 sysdm.cpl,EditEnvironmentVariables

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

