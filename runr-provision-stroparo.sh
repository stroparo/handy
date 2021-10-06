#!/bin/bash
{
which curl || (sudo apt-get install curl >/dev/null 2>&1)
bash -c "$(curl -LSf "https://bitbucket.org/stroparo/runr/raw/master/entry.sh" \
  || curl -LSf "https://raw.githubusercontent.com/stroparo/runr/master/entry.sh")" \
  entry.sh provision-stroparo
. "${DS_HOME:-$HOME/.ds}/ds.sh"
. ~/.aliases-cs
}
