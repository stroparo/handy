:: VPN Unlimited

set PROG=C:\"Program Files"
set PROG32=C:\"Program Files (x86)"
if not exist %PROG32% set PROG32=%PROG%

net start VPNUnlimitedService
timeout /nobreak 3
start %PROG32%\"VPN Unlimited"\vpn-unlimited.exe

exit
