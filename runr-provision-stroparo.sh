#!/bin/bash
{
RECIPE=provision-stroparo
: ${DEV:=${HOME}/workspace}
which curl || (sudo apt-get install curl >/dev/null 2>&1) || (sudo pacman -S curl >/dev/null 2>&1)
if [ -d "${DEV}/dotfiles" ] ; then
  export RUNR_ASSETS_REPOS="${DEV}/dotfiles"
  export RUNR_ASSETS_REPOS_FALLBACKS=""
fi
bash -c "$(cat "${DEV}/runr/entry.sh" 2>/dev/null \
    || curl -LSf "https://raw.githubusercontent.com/stroparo/runr/master/entry.sh" \
    || curl -LSf "https://bitbucket.org/stroparo/runr/raw/master/entry.sh")" \
    entry.sh "${RECIPE}"
. "${ZDRA_HOME:-$HOME/.zdra}/zdra.sh"
. ~/.aliases-cs
}
