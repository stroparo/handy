# Handy

* @stroparo - [bitbucket](https://bitbucket.org/dashboard/repositories?projectKey=STMAIN&projectOwner=%7B0aefcc98-9b42-4cd9-86b8-e49f49e007ea%7D) - [github](https://github.com/stroparo?tab=repositories&q=&type=source&language=) - [gitlab](https://gitlab.com/dashboard/projects?personal=true&sort=name_asc)
* [Apps](https://www.notion.so/Apps-a0911d71491446678fb3c3a8233cbe5b)
* [Flight Simulation links](https://www.notion.so/Flight-Simulation-links-b3ac9d0d96c34fe3b07803ce99b55510)

## Provisioning

If on Windows then ignore the instructions below and just call ```provision-cz-win.bat```.

IMPORTANT:
DO NOT REENGINEER the snippet below as it already sources the script containing a more ellaborate "calling logic":

```
if ! grep -q ${RECIPE_SUFFIX:-cz} ~/.dsplugins ; then
  cd ; git clone --depth 1 https://github.com/stroparo/handy.git .handy
  cd .handy
  source ./runr-provision-${RECIPE_SUFFIX:-cz}.sh
  rm -rf ~/.handy
fi

```
