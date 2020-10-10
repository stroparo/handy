:: TODO overhaul as this script is way outdated

:: Dependencies
set PAROOT=\PortableApps
if not exist %PAROOT% set PAROOT=Z:\PortableApps
set PKGDIR=\csn\sw-cloud-spares
if not exist %PKGDIR% if exist %DROPBOXHOME%\sw\4windows set PKGDIR=%DROPBOXHOME%\sw\4windows
if not exist %PKGDIR% if exist S:\csn\sw-cloud-spares set PKGDIR=S:\csn\sw-cloud-spares
set TOOLKITDIR=\toolkit
if not exist %TOOLKITDIR% if exist C:\opt\toolkit set TOOLKITDIR=C:\opt\toolkit
if not exist %TOOLKITDIR% if exist D:\toolkit set TOOLKITDIR=D:\toolkit
if not exist %TOOLKITDIR% if exist E:\toolkit set TOOLKITDIR=E:\toolkit
if not exist %TOOLKITDIR% if exist L:\toolkit set TOOLKITDIR=L:\toolkit
if not exist %TOOLKITDIR% if exist S:\toolkit set TOOLKITDIR=S:\toolkit
if not exist %TOOLKITDIR% if exist T:\toolkit set TOOLKITDIR=T:\toolkit
set WINSCRIPTS=\scripts-win
if not exist %WINSCRIPTS% set WINSCRIPTS=%DEV%\handy\scripts\win
set WINCONF=%DEV%\winconf
if not exist %WINCONF% if exist %TOOLKITDIR%\winconf set WINCONF=%TOOLKITDIR%\winconf
:: Fail if any of these deps is missing
if not exist "%PKGDIR%" (echo "Missing dir %PKGDIR% (PKGDIR)" & pause & exit 1)
if not exist "%PAROOT%" (echo "Missing dir %PAROOT% (PAROOT, PortableApps root)" & pause & exit 1)


:: Apps
set SEVENFM=%PAROOT%\7-ZipPortable\App\7-Zip\7zFM.exe
set SEVENZIP=%PAROOT%\7-ZipPortable\App\7-Zip\7z.exe
set VERA=%PAROOT%\VeraCryptPortable\VeraCryptPortable.exe
set VERAFAV=%DROPBOXHOME%\conf\veracrypt\Favorite Volumes.xml
set VERAINST=%ProgramFiles%\VeraCrypt
set VERAPKG=V:\bak\toolkit\veracrypt.exe.7z
set VERAPKGALTN=F:\bak\toolkit\veracrypt.exe.7z


rem @echo Setting up decryption with TrueCrypt...
rem TODO


rem @echo Setting up decryption with VeraCrypt...
rem if not exist "%VERAINST%" (if exist "%VERAPKG%" "%SEVENFM%" "%VERAPKG%")
rem if not exist "%VERAINST%" (if exist "%VERAPKGALTN%" "%SEVENFM%" "%VERAPKGALTN%")
rem if exist "%VERAINST%" set VERA=%VERAINST%\VeraCrypt.exe
rem if not exist %AppData%\VeraCrypt md %AppData%\VeraCrypt
rem if exist "%VERAFAV%" copy /Y "%VERAFAV%" %AppData%\VeraCrypt\
rem @echo "VeraCrypt's 'Favorite Volumes.xml' copied to %AppData%\VeraCrypt\"
rem @echo "You may mount any encrypted partition now..."
rem @echo "... also create the opt dir... (OPTPARTITION=%OPTPARTITION%)"
rem start "%VERA%"
rem pause


if exist "%MYOPT%" (
  @echo "Installing packages to MYOPT (%MYOPT%)..."
  md %MYOPT%

  :: This extracted archive must have an 'opt' dir inside, otherwise
  ::  change the -o option to point to %MYOPT% instead of %OPTPARTITION% ...
  if not exist %MYOPT% %SEVENZIP% e -o%MYOPT% -r -spf %BASEDIR%\win-opt-toolkit.zip

  @echo "Finished installations in MYOPT (%MYOPT%)..."
  pause
)


@echo Installing programs...
if not exist "%ProgramFiles%"\7-Zip start %TOOLKITDIR%\setups\ninite-backups\7z1805-x64.exe
if not exist "%ProgramFiles%"\Notepad2 %TOOLKITDIR%\setups\notepad2_4.2.25_x64.exe
if not exist "%ProgramFiles%"\"Path Copy Copy" %TOOLKITDIR%\setups\pathcopy.exe
if not exist "%ProgramFiles%"\TrueCrypt %TOOLKITDIR%\setups\"TrueCrypt Setup 7.1a".exe


if exist %WINCONF% (
  @echo Setting up explorer preferences via registry...
  regedit /S \winconf\explorer-checkboxes.reg
  regedit /S \winconf\explorer-show-extensions.reg
  regedit /S \winconf\explorer-show-files.reg
)


@echo Setting user preferences...
intl.cpl
main.cpl
%windir%\system32\control.exe sysdm.cpl,System,3


@echo SUCCESS. About to launch the boot sequence...
pause


if exist %WINSCRIPTS%\boot.bat %COMSPEC% /K %WINSCRIPTS%\boot.bat

