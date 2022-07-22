set CWD=%~dp0
set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

if exist "%PROG%\NVIDIA" goto :oknvidia
if exist "%PROG%\NVIDIA Corporation" goto :oknvidia
if exist "%PROG32%\NVIDIA Corporation" goto :oknvidia
if exist "%PROGRAMDATA%\NVIDIA" goto :oknvidia
if exist "%PROGRAMDATA%\NVIDIA Corporation" goto :oknvidia
if exist %NVIDIAINSTALLER% %NVIDIAINSTALLER%
:oknvidia
