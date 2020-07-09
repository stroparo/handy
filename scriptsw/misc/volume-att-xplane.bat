for /F "TOKENS=1,2,*" %%a in ('tasklist /FI "IMAGENAME eq X-Plane.exe"') do set XPLANEPID=%%b
%USERPROFILE%\opt\nircmd\nircmd.exe changeappvolume /%XPLANEPID% -0.5
