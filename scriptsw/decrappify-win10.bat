:: RUN THIS AS ADMINISTRATOR

:: Sources:
:: https://www.minitool.com/news/windows-10-services-to-disable.html
:: https://www.pcerror-fix.com/windows-10-services-to-disable-for-gaming
:: https://www.reginout.com/help-center/turn-off-windows-10-services-get-unfair-speed-boost/

:: Disabled in here, now in batch script in (\handy)\conf\win-registry-favs\w10-memory-compression-disable-run-as-admin.bat
:: Disable CPU-hogging memory (RAM) compression:
rem powershell "Disable-MMAgent -mc"

:: Geoloc
sc config lfsvc start= disabled
sc stop   lfsvc
sc config MapsBroke start= disabled
sc stop   MapsBroke

:: I/O
sc config TabletInputService start= disabled
sc stop   TabletInputService

:: IoT
sc config AJRouter start= disabled
sc stop   AJRouter

:: Mem Preload
sc config SysMain start= disabled
sc stop   SysMain

:: Sec Parental Control
sc config WpcMonSvc start= disabled
sc stop   WpcMonSvc

:: Sec (these are) vulnerabilities if kept active:
sc config RemoteRegistry start= disabled
sc stop   RemoteRegistry

:: Mobile / telephony
sc config TapiSrv start= disabled
sc stop   TapiSrv

::Windows Backup
sc config fhsvc start= disabled
sc stop   fhsvc

:: Windows Error Reporting
rem sc config WerSvc start= disabled
rem sc stop   WerSvc

:: Windos Media Player => disabled to keep screen sharing to the TV
rem sc config WMPNetworkSvc start= disabled
rem sc stop   WMPNetworkSvc

:: Windows Search
sc config WSearch start= disabled
sc stop   WSearch

:: Work environment / Corporate
rem sc config Netlogon start= disabled
rem sc stop   Netlogon

:: XBOX
rem sc config XblAuthManager start= disabled
rem sc stop   XblAuthManager
rem sc config XblGameSave start= disabled
rem sc stop   XblGameSave
rem sc config XboxNetApiSvc start= disabled
rem sc stop   XboxNetApiSvc

:: Miscellaneous Junk
sc config Fax start= disabled
sc stop   Fax
sc config RetailDemo start= disabled
sc stop   RetailDemo

timeout -1
