#!/bin/bash
{
RECIPE=provision-stroparo
which curl || (sudo apt-get install curl >/dev/null 2>&1) || (sudo pacman -S curl >/dev/null 2>&1)
if [ -d "${DEV}/runr" ] ; then
  # Setup from local files:
  if [ -d "${DEV}/dotfiles" ] ; then
    (
      export RUNR_ASSETS_REPOS="${DEV}/dotfiles"
      export RUNR_ASSETS_REPOS_FALLBACKS=""
      bash -c "$(cat "${DEV}/runr/entry.sh")" entry.sh "${RECIPE}"
    )
  else
    bash -c "$(cat "${DEV}/runr/entry.sh")" entry.sh "${RECIPE}"
  fi
else
  # Setup from remote files:
  bash -c "$(curl -LSf "https://bitbucket.org/stroparo/runr/raw/master/entry.sh" \
      || curl -LSf "https://raw.githubusercontent.com/stroparo/runr/master/entry.sh")" \
      entry.sh "${RECIPE}"
fi
. "${ZDRA_HOME:-$HOME/.zdra}/zdra.sh"
. ~/.aliases-cs
}
