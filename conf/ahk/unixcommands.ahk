SetTitleMatchMode, 2 ; contain title

#Hotstring *

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
