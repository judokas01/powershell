
#Start-Process -FilePath "C:\Program Files\Malwarebytes\Anti-Malware\mbam.exe"# -ArgumentList "--threatscan"
& "C:\Program Files\Malwarebytes\Anti-Malware\assistant.exe" -argument "--threatscan"

$folder = (get-date -format "yyyyMMdd")
mkdir c:\hotline\profylaxe\registr\
REGEDIT /E C:\hotline\profylaxe\registr\${folder}.reg
mkdir c:\hotline\profylaxe\eventlog\${folder}\
wuauclt /detectnow /updatenow
UsoClient ScanInstallWait
wevtutil epl Application c:\hotline\profylaxe\eventlog\${folder}\app.evtx
wevtutil epl System c:\hotline\profylaxe\eventlog\${folder}\sys.evtx
#get-eventlog application -entrytype error,warning
#get-eventlog system -entrytype error,warning

remove-item $env:temp/* -force -recurse
remove-item C:\windows\temp\* -force -recurse	
clear-eventlog application
clear-eventlog system
clear-eventlog security
cd C:/users
ls | foreach-object {$user = $_.name
remove-item C:\users\$user\appdata\local\temp\* -force -recurse
}