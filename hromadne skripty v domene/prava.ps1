#net localgroup administrators lucie.trinklova /add
#net localgroup administrators helen.lichtenbergova /add
#net localgroup administrators jana.moravcova /add
#net localgroup administrators jaroslava.kreckova /add
#net localgroup administrators jaroslava.mandlova /add
#net localgroup administrators josef.rakosnik /add
#net localgroup administrators katerina.belecka /add
#net localgroup administrators zuzana.horejskova /add
#shutdown /r /t 0
wuauclt /detectnow /updatenow
UsoClient ScanInstallWait
msiexec /i C:\hotline\installtightvnc.msi /quiet /norestart ADDLOCAL=Server SERVER_REGISTER_AS_SERVICE=1 SERVER_ADD_FIREWALL_EXCEPTION=1 SET_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=root