@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

set CWD=%~dp0
set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

set PKGWIN=%STDIRSYNC%\pkgs-4windows
if not exist "%PKGWIN%" if exist D:\sp--pkgs\pkgs-4windows set PKGWIN=D:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist E:\sp--pkgs\pkgs-4windows set PKGWIN=E:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist F:\sp--pkgs\pkgs-4windows set PKGWIN=F:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist H:\sp--pkgs\pkgs-4windows set PKGWIN=H:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist M:\sp--pkgs\pkgs-4windows set PKGWIN=M:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist N:\sp--pkgs\pkgs-4windows set PKGWIN=N:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist S:\sp--pkgs\pkgs-4windows set PKGWIN=S:\sp--pkgs\pkgs-4windows
if not exist "%PKGWIN%" if exist W:\pkgs-4windows set PKGWIN=W:\pkgs-4windows
if not exist "%PKGWIN%" if exist X:\pkgs-4windows set PKGWIN=X:\pkgs-4windows
if not exist "%PKGWIN%" if exist Y:\pkgs-4windows set PKGWIN=Y:\pkgs-4windows
if not exist "%PKGWIN%" if exist Z:\pkgs-4windows set PKGWIN=Z:\pkgs-4windows
set PKGDEVEL=%PKGWIN%\devel
set PKGMAINT=%PKGWIN%\maint
set PKGMAINTMISC=%PKGWIN%\maint\misc
set PKGNINITE=%PKGWIN%\maint\ninite-singletons
set PKGOPT=%PKGWIN%\opt

:: Other packages:
set DATAXCS=J:\dataxcs
set PKGEXTRA=%DATAXCS%\pkgs-4windows-extras
set PKGREGD=%DATAXCS%\pkgs-4windows-registered
:: Macrium Reflect Free image cloning:
set PKGMACRIUM=%DATAXCS%\pkgs-4windows-registered\macrium-free.exe
set PKGMACRIUMB=M:\sp--pkgs\macrium-free.exe
set PKGMACRIUMC=N:\sp--pkgs\macrium-free.exe
set PKGWSL=%DATAXCS%\pkgs-4windows-wsl-linux

:: Etcetera
set DIRGIT1=%UserProfile%\scoop\apps\git-with-openssh
set DIRGIT2=%ProgramFiles%\Git
set PKGGIT=J:\dataxcstm\pkgs-4windows-conting\offline-installers\git.exe


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: started setting up applications ...


:: Ninite automated installations:
:: Quote this ninite call command below for 7zip otherwise it oddly breaks:
rem if not exist "%ProgramFiles%"\7-Zip  "%PKGNINITE%\Ninite 7Zip Installer.exe"
%PKGMAINT%\"ninite.exe"
if %computername% == RAMBO0 goto :ninirambo
goto :nininonrambo

:nininonrambo
"%PKGNINITE%\Ninite Everything Installer.exe"
"%PKGNINITE%\Ninite Launchy Installer.exe"
goto :niniend

:ninirambo
rem if not exist %PROG32%\Steam                     	"%PKGNINITE%\Ninite Steam Installer.exe"
goto :niniend

:niniend


:: Deploy portable applications (semi-automated):
%COMSPEC% /c %PKGOPT%\0deploy.bat
explorer %PKGMAINT%\net-installers
explorer %PKGDEVEL%
explorer %PKGEXTRA%
explorer %PKGREGD%
explorer %PKGWSL%
echo Complete the manual package setups then hit ENTER to continue...
echo ...
echo ...
pause


:: Regular setups:
if not exist %PROG32%\Auslogics\"Duplicate File Finder"     %PKGMAINT%\duplicate-file-finder-setup.exe /silent
if not exist "%ProgramFiles%"\Defraggler        %PKGMAINT%\manually-updated\dfsetup.exe /silent
if not exist %PROG32%\DroidCam        			%PKGMAINT%\manually-updated\droidcam.exe
if not exist "%ProgramFiles%"\Eraser            %PKGMAINT%\eraser-5.8.8.exe /silent
if not exist %PROG32%\GPU-Z                     %PKGMAINT%\manually-updated\gpuz.exe
if not exist "%ProgramFiles%"\HWiNFO64        	%PKGMAINT%\manually-updated\hwi.exe
if not exist %PROG32%\No-IP                     %PKGMAINT%\manually-updated\noip.exe
if not exist "%ProgramFiles%"\Notepad2          %PKGMAINT%\notepad2x64.exe
if not exist "%ProgramFiles%"\"Path Copy Copy"  %PKGMAINT%\pathcopy.exe /silent
if not exist "%ProgramFiles%"\"Rapid Environment Editor"  %PKGMAINT%\manually-updated\RapidEE_setup.exe /SILENT
rem if not exist "%ProgramFiles%"\"S3 Browser"      %PKGMAINT%\manually-updated\s3browser.exe
rem if not exist "%ProgramFiles%"\TrueCrypt         %PKGMAINT%\truecrypt-7.1a-setup.exe
rem if not exist "%ProgramFiles%"\VeraCrypt         %PKGEXTRA%\veracrypt.exe
if not exist %SystemRoot%\SysWOW64\us-inter.dll  %PKGMAINT%\us-intl-altgr-dead-keys\setup.exe
if not exist %PROG32%\Wally        				%PKGMAINT%\manually-updated\wally.exe

:: TODO create calls for these, similar as the above ones:
rem %PKGEXTRA%\Linux_Reader.exe
rem %PKGMAINT%\ExplorerSuite.exe /silent
rem %PKGEXTRA%\VPN_Unlimited_v7.4.exe /SP- /VERYSILENT /NORESTART

:: Macrium FS backup
if not exist "%ProgramFiles%"\Macrium  if exist %PKGMACRIUM%  	%PKGMACRIUM%
if not exist "%ProgramFiles%"\Macrium  if exist %PKGMACRIUMB%  	%PKGMACRIUMB%
if not exist "%ProgramFiles%"\Macrium  if exist %PKGMACRIUMC% 	%PKGMACRIUMC%


:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: setting up scoop installer applications...
pause

cmd /C scoop install git-with-openssh
cmd /C scoop install openssh

cmd /C scoop install autossh mosh-client
cmd /C scoop install bit
cmd /C scoop install colortool
cmd /C scoop install editorconfig
cmd /C scoop install geckodriver
cmd /C scoop install gettext
cmd /C scoop install lftp
cmd /C scoop install netcat
cmd /C scoop install ntop
rem cmd /C scoop install openssl
rem cmd /C scoop install openssl-mingw
cmd /C scoop install powerping

:: Automate daily stuff
cmd /C scoop install gallery-dl
cmd /C scoop install minisign
cmd /C scoop install qpdf
cmd /C scoop install qr
cmd /C scoop install pdfbox
cmd /C scoop install youtube-dl

:: Dev - containers
rem cmd /C scoop install containerd
rem cmd /C scoop install docker
rem cmd /C scoop install docker-compose
rem cmd /C scoop install docker-pushrm
rem cmd /C scoop install k3d
rem cmd /C scoop install k3sup
rem cmd /C scoop install kind
rem cmd /C scoop install odo
rem cmd /C scoop install podman
:: Convert docker-compose to k8s/openshift:
rem cmd /C scoop install kompose
rem cmd /C scoop install krew
rem cmd /C scoop install kubeadm
rem cmd /C scoop install kubectl
rem cmd /C scoop install kubectx
rem cmd /C scoop install kubefwd
rem cmd /C scoop install kubens
rem cmd /C scoop install kubescape
rem cmd /C scoop install kubeseal
rem cmd /C scoop install kubeval
rem cmd /C scoop install kustomize
:: Verify deprecated apiVersions K8s/Helm:
rem cmd /C scoop install pluto

:: Dev - containers - K8s managers:
rem cmd /C scoop install k9s
rem cmd /C scoop install kops
rem cmd /C scoop install loft
rem cmd /C scoop install minikube

:: Dev - Git
cmd /C scoop install git-with-openssh
cmd /C scoop install git-lfs
cmd /C scoop install git-town
cmd /C scoop install gitkube
cmd /C scoop install gibo gitignore
cmd /C scoop install gitversion
cmd /C scoop install glitter
cmd /C scoop install legit

:: Dev services CLIs, mostly
cmd /C scoop install circleci-cli
cmd /C scoop install firebase
:: GitHub
cmd /C scoop install gh hub
:: GitLab:
cmd /C scoop install glab lab
cmd /C scoop install heroku-cli
:: Kafka
rem cmd /C scoop install kaf

:: Dev tools
cmd /C scoop install grpcurl
:: Gradle/Maven wrapper:
cmd /C scoop install gum
cmd /C scoop install hexed hexyl
cmd /C scoop install highlight
cmd /C scoop install hjson
cmd /C scoop install hostctl
cmd /C scoop install htmlq
cmd /C scoop install iconv
cmd /C scoop install jq
cmd /C scoop install pester

:: File manipulation, visualization etc.
cmd /C scoop install ag
cmd /C scoop install bat
cmd /C scoop install bzip2
cmd /C scoop install diffutils patch
cmd /C scoop install dos2unix
cmd /C scoop install gawk
cmd /C scoop install glow
cmd /C scoop install grep
cmd /C scoop install gzip
cmd /C scoop install less
cmd /C scoop install mdbook
cmd /C scoop install mdcat

:: Filesystem, backup, manipulation etc.
cmd /C scoop install brename
cmd /C scoop install dua duf dust
cmd /C scoop install empty-recycle-bin
cmd /C scoop install file
cmd /C scoop install ln
cmd /C scoop install lsd
cmd /C scoop install qrcp
cmd /C scoop install rclone
cmd /C scoop install restic

:: Local Services
rem cmd /C scoop install etcd
rem cmd /C scoop install miniserve

:: Windows
cmd /C scoop install gsudo


:: Extras
scoop bucket add extras
:: Filesystem, backup, manipulation etc.
cmd /C scoop install everything-cli
:: WSL (Linux) - Arch Linux in WSL (disable here and prefer one vm per renamed exe file instead):
:: https://github.com/yuk7/ArchWSL#archwsl
rem scoop install archwsl


echo Removing all cached scoop packages...
del /F /Q %UserProfile%\scoop\cache\*

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo setupapps: devel applications (scoop contingencies etc.) ...

if exist "%DIRGIT1%"  goto :gitok
if exist "%DIRGIT2%"  goto :gitok
if exist "%PKGGIT" 	"%PKGGIT"
:gitok

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pause
