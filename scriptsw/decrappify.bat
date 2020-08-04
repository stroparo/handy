:: Sources:
:: https://www.minitool.com/news/windows-10-services-to-disable.html
:: https://www.pcerror-fix.com/windows-10-services-to-disable-for-gaming
:: https://www.reginout.com/help-center/turn-off-windows-10-services-get-unfair-speed-boost/

:: Disable CPU-hogging memory (RAM) compression:
powershell "Disable-MMAgent -mc"

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
sc config WerSvc start= disabled
sc stop   WerSvc

:: Windos Media Player => disabled to keep screen sharing to the TV
rem sc config WMPNetworkSvc start= disabled
rem sc stop   WMPNetworkSvc

:: Windows Search
sc config WSearch start= disabled
sc stop   WSearch

:: Work environment / Corporate
sc config Netlogon start= disabled
sc stop   Netlogon

:: XBOX
sc config XblAuthManager start= disabled
sc stop   XblAuthManager
sc config XblGameSave start= disabled
sc stop   XblGameSave
sc config XboxNetApiSvc start= disabled
sc stop   XboxNetApiSvc

:: Miscellaneous Junk
sc config DiagTrack start= disabled
sc stop   DiagTrack
sc config Fax start= disabled
sc stop   Fax
sc config RetailDemo start= disabled
sc stop   RetailDemo

timeout -1
