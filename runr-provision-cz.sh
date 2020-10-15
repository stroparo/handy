#!/bin/bash
{
bash -c "$(curl -LSf "https://bitbucket.org/stroparo/runr/raw/master/entry.sh" \
  || curl -LSf "https://raw.githubusercontent.com/stroparo/runr/master/entry.sh")" \
  entry.sh provision-cz
. "${DS_HOME:-$HOME/.ds}/ds.sh"
. ~/.aliases-cs
}
