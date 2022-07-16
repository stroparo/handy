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
cmd /C scoop install containerd
cmd /C scoop install docker
cmd /C scoop install docker-compose
cmd /C scoop install docker-pushrm
cmd /C scoop install k3d
cmd /C scoop install k3sup
cmd /C scoop install kind
cmd /C scoop install odo
cmd /C scoop install podman

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
cmd /C scoop install kaf

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

