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

::lavaseca::0UE95ADR202516K

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Daily speech - english

::??rev::@devops, please review and approve{Space}
::afaik::As far as I know,{space}
::imho::In my opinion,{space}
::tyvm::Thank you very much,{space}

:R:??clo::
Send Hello,+{Enter}
Send Please validate issue(s) is/are solved and advise ASAP for proper story/ticket closure. Thanks.+{Enter}
Send Thanks,+{Enter}
Send {Up}{Up}
return

:R:??upd::
Send Hello,+{Enter}
Send Please see the update in the story's discussion and validate on your side.+{Enter}
Send Thanks,+{Enter}
Send {Up}{Up}
return

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Daily speech - portuguese

::bdia::bom dia, td bem?
::btar::boa tarde, td bem?
::bnoi::boa noite, td bem?
::tdbem::oi, td bem?
::tdvc::oi, td bem e voce?

; Work statuses - portuguese
::--ana::Analisando.
::--imp::Em implantação
::--des::Em desenvolvimento
::--doc::Em processo de documentação
::--int::Teste integrado em execução
::--icr::Investigando causa raiz
::--tu::Teste unitário em execução
::--agap::Aguardando aprovação
::--agst::Aguardando status
::--agch::Aguardando abertura de chamado
::--agus::Aguardando usuário

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Common commands

; Groups must be defined at the top of the file to work
;GroupAdd, abrowser, Chrome
;GroupAdd, abrowser, Firefox
;#IfWinActive ahk_group abrowser

;#Include %A_ScriptDir%\filename.ahk

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input - CV / Resume

::cpb::Curitiba, PR, Brazil
::cvxp::Experience
::cved::Education
::cvco::Courses
::cvce::Certificates
::cvpr::Side Projects (Open Source)
::jjdeve::Software Developer
::jjdevo::DevOps Engineer

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
; Unix/*Nix/Linux Shell commands

; Basic
::zzgit::%ProgramFiles%\Git\usr\bin\mintty.exe -w max -
::zzsho::set -b`; set -o vi`;export EDITOR=vim{Enter}

; Basic - runr
::zzrunr::bash -c "$(curl -LSf "https://bitbucket.org/stroparo/runr/raw/master/entry.sh" || curl -LSf "https://raw.githubusercontent.com/stroparo/runr/master/entry.sh")" entry.sh{Space}
::zzalias::bash -c "$(curl -LSf "https://bitbucket.org/stroparo/runr/raw/master/entry.sh" || curl -LSf "https://raw.githubusercontent.com/stroparo/runr/master/entry.sh")" entry.sh alias {;} . ~/.aliases-cs{ENTER}
::zzds::bash -c "$(curl -LSf "https://bitbucket.org/stroparo/runr/raw/master/entry.sh" || curl -LSf "https://raw.githubusercontent.com/stroparo/runr/master/entry.sh")" entry.sh alias setupsidra {;} . ~/.aliases-cs {;} . ~/.zdra/zdra.sh ~/.zdra{ENTER}
::zzssh::bash -c "$(curl -LSf "https://bitbucket.org/stroparo/runr/raw/master/entry.sh" || curl -LSf "https://raw.githubusercontent.com/stroparo/runr/master/entry.sh")" entry.sh sshkeygen sshmodes {;} . ~/.aliases-cs{ENTER}

; Loops
::whileread::while read i `; do echo "$i" `; done
::xargs1::xargs -I{} -n1{Space}

; Partials
::pyjson::python -c 'import sys, json`; print json.load(sys.stdin)["'
::suuu::sudo su -{Space}


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Windows commands

::envvar::rundll32 sysdm.cpl,EditEnvironmentVariables


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

