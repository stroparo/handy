@echo off

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Globals

set MYOPT=%USERPROFILE%\opt
if not exist %MYOPT% md %MYOPT%

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Settings up globals in userspace (SETX) ...

echo
echo MYOPT=%MYOPT%
echo

:: ProgramFiles PROG and PROG32 globals:
set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

:: Local env globals setup:
set CLOUDPARENT=%USERPROFILE%
set CSCRYPTBASENAME=zz.hc
set CSCRYPTFILENAME=%USERPROFILE%\%CSCRYPTBASENAME%
if not exist "%CSCRYPTFILENAME%" if exist K:\%CSCRYPTBASENAME% set CSCRYPTFILENAME=K:\%CSCRYPTBASENAME%
if not exist "%CSCRYPTFILENAME%" if exist J:\%CSCRYPTBASENAME% set CSCRYPTFILENAME=J:\%CSCRYPTBASENAME%
if not exist "%CSCRYPTFILENAME%" if exist I:\%CSCRYPTBASENAME% set CSCRYPTFILENAME=I:\%CSCRYPTBASENAME%
if not exist "%CSCRYPTFILENAME%" if exist F:\%CSCRYPTBASENAME% set CSCRYPTFILENAME=F:\%CSCRYPTBASENAME%
if not exist "%CSCRYPTFILENAME%" if exist E:\%CSCRYPTBASENAME% set CSCRYPTFILENAME=E:\%CSCRYPTBASENAME%
if not exist "%CSCRYPTFILENAME%" if exist D:\%CSCRYPTBASENAME% set CSCRYPTFILENAME=D:\%CSCRYPTBASENAME%
set DATACSPC=%USERPROFILE%\datacspc
set DATAXCSDISK=K:
set DEV=Z:\workspace
set DRIVERSDIR=K:\dataxcstm\pkgs-drivers
set GAMESHOME=K:\games
set NVIDIAINSTALLER=K:\dataxcstm\pkgs-drivers\NVCleanstall.exe
set PAROOT=Z:\PortableApps
set PKGWIN=Z:\datacsyn\pkgs-4windows
set STDIRSYNC=Z:\datacsyn

:: Local env globals derived from other globals:
set DATAXCS=%DATAXCSDISK%\dataxcs
set DATAXCSTM=%DATAXCSDISK%\dataxcstm
set USERTEMP=%USERPROFILE%\AppData\Local\Temp
set USERTMP=%USERPROFILE%\AppData\Local\Temp
:: Cloud:
set DROPBOXHOME=%CLOUDPARENT%\Dropbox
set GGLDRIVEHOME=G:\My Drive
set ONEDRIVEHOME=%CLOUDPARENT%\OneDrive

:: User env globals setup (Windows userspace, permanent):
@echo on
SETX CLOUDPARENT "%CLOUDPARENT%"
SETX CSCRYPTBASENAME "%CSCRYPTBASENAME%"
SETX CSCRYPTFILENAME "%CSCRYPTFILENAME%"
SETX DATACSPC "%DATACSPC%"
SETX DATAXCS "%DATAXCS%"
SETX DATAXCSTM "%DATAXCSTM%"
SETX DEV "%DEV%"
SETX DRIVERSDIR "%DRIVERSDIR%"
SETX GAMESHOME "%GAMESHOME%"
SETX MYOPT "%MYOPT%"
SETX NVIDIAINSTALLER "%NVIDIAINSTALLER%"
SETX PAROOT "%PAROOT%"
SETX PROG "%PROG%"
SETX PROG32 "%PROG32%"
SETX PKGWIN "%PKGWIN%"
SETX STDIRSYNC "%STDIRSYNC%"
SETX USERTEMP "%USERTEMP%"
SETX USERTMP "%USERTMP%"
:: Cloud:
SETX DROPBOXHOME "%DROPBOXHOME%"
SETX GGLDRIVEHOME "%GGLDRIVEHOME%"
SETX ONEDRIVEHOME "%ONEDRIVEHOME%"
@echo off

:: PATH global:
set GPATH=%MYOPT%\ag
set GPATH=%GPATH%;%USERPROFILE%\scoop\shims
set GPATH=%GPATH%;%MYOPT%\clamav
set GPATH=%GPATH%;%MYOPT%\clcl
set GPATH=%GPATH%;%MYOPT%\git
set GPATH=%GPATH%;%MYOPT%\git\bin
set GPATH=%GPATH%;%MYOPT%\git\cmd
set GPATH=%GPATH%;%MYOPT%\junction
set GPATH=%GPATH%;%MYOPT%\md5deep
set GPATH=%GPATH%;%MYOPT%\nvm
rem set GPATH=%GPATH%;%MYOPT%\OpenSSH-Win64
set GPATH=%GPATH%;%MYOPT%\pstools
set GPATH=%GPATH%;%MYOPT%\sdelete
set GPATH=%GPATH%;%MYOPT%\sqlite
set GPATH=%GPATH%;%MYOPT%\subl
set GPATH=%GPATH%;%MYOPT%\apache-tomcat-7.0.99\bin
rem set GPATH=%GPATH%;%MYOPT%\eclipse
set GPATH=%GPATH%;%MYOPT%\jdk1.8.0_251\app\bin
set GPATH=%GPATH%;%MYOPT%\jdk1.8.0_251\app\jre\bin
set GPATH=%GPATH%;%MYOPT%\maven\bin
set PATH=%PATH%;%GPATH%
@echo on
SETX PATH "%GPATH%"
@echo off

echo
echo SETX (global environment variables) definitions COMPLETE.
echo
echo IMPORTANT (DOUBLE CONFIRMATION BELOW)
echo IMPORTANT (DOUBLE CONFIRMATION BELOW)
echo If globals changed (e.g. pristine host) terminate this before next routines are ran...
echo If globals changed (e.g. pristine host) terminate this before next routines are ran...
pause
pause
