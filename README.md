# Handy

* [Apps](https://www.notion.so/Apps-a0911d71491446678fb3c3a8233cbe5b)
* [Dev links](https://github.com/stroparo/devlinks#dev-links)
* Dev repos - [bitbucket](https://bitbucket.org/dashboard/repositories?projectKey=STMAIN&projectOwner=%7B0aefcc98-9b42-4cd9-86b8-e49f49e007ea%7D) - [github](https://github.com/stroparo?tab=repositories&q=&type=source)/[gists](https://gist.github.com/stroparo) - [gitlab](https://gitlab.com/dashboard/projects?personal=true&sort=name_asc)
* [Flight Simulation links](https://www.notion.so/Flight-Simulation-links-b3ac9d0d96c34fe3b07803ce99b55510)

## Provisioning

### Windows

If on Windows then ignore the instructions below and just execute the ```provision-*``` files in order - likely for the first one (about execution policy) you will have to open it up in notepad, copy the command and paste it in a PowerShell terminal window running as administrator.

Then in Git for Windows (Git Bash etc.) remove any pre existing files and provision:

```
rm -f -r ~/.runr ~/.zdra* \
  && eval "$(curl -fsS 'https://raw.githubusercontent.com/stroparo/handy/master/runr-provision-cz.sh')"
```

From local handy repository:

```
rm -f -r ~/.runr ~/.zdra* \
  && cd \
  && ${DEV:-$HOME/workspace}/handy/runr-provision-cz.sh')"
```

## Provision Linux & Unix

IMPORTANT:
DO NOT REENGINEER any snippet below as it already sources the script containing a more ellaborate "calling logic".

```
eval "$(curl -fsS 'https://raw.githubusercontent.com/stroparo/handy/master/runr-provision-cz.sh')"
```

```
eval "$(curl -fsS 'https://raw.githubusercontent.com/stroparo/handy/master/runr-provision-stroparo.sh')"
```
