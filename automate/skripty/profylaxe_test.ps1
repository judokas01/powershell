$folder = (get-date -format "yyyyMMdd")

if( -Not (Test-Path -Path c:\hotline\profylaxe\eventlog\${folder} )){
echo "profylaxe neproběhla"
enable-psremoting -force
& "C:\Program Files\Malwarebytes\Anti-Malware\assistant.exe" --threatscan
& "c:\Program Files (x86)\Spybot - Search & Destroy 2\SDUpdate.exe"
& "c:\Program Files (x86)\Spybot - Search & Destroy 2\SDImmunize.exe"
& "c:\Program Files (x86)\Spybot - Search & Destroy 2\explorer.exe"
$folder = (get-date -format "yyyyMMdd")
mkdir c:\hotline\profylaxe\registr\
REGEDIT /E C:\hotline\profylaxe\registr\${folder}.reg
mkdir c:\hotline\profylaxe\eventlog\${folder}\
wuauclt /detectnow /updatenow
UsoClient ScanInstallWait
wevtutil epl Application c:\hotline\profylaxe\eventlog\${folder}\app.evtx
wevtutil epl System c:\hotline\profylaxe\eventlog\${folder}\sys.evtx
get-eventlog system -entrytype error, Warning | Group-Object -Property Source, InstanceId, Message -NoElement | Sort-Object -Property Count -Descending | Out-GridView
get-eventlog application -entrytype error, Warning | Group-Object -Property Source, InstanceId, Message -NoElement | Sort-Object -Property Count -Descending | Out-GridView
get-eventlog security -entrytype error, Warning | Group-Object -Property Source, InstanceId, Message -NoElement | Sort-Object -Property Count -Descending | Out-GridView

remove-item $env:temp/* -force -recurse
remove-item C:\windows\temp\* -force -recurse	
clear-eventlog application
clear-eventlog system
clear-eventlog security
cd C:/users
ls | foreach-object {$user = $_.name
remove-item C:\users\$user\appdata\local\temp\* -force -recurse
}
cd 'C:\Program Files\Classic Shell\'
.\ClassicStartMenu.exe -upgrade
pause
exit



}
else {
echo "profylaxe proběhla"
& "C:\Program Files\Malwarebytes\Anti-Malware\assistant.exe" --threatscan
& "c:\Program Files (x86)\Spybot - Search & Destroy 2\SDUpdate.exe"
& "c:\Program Files (x86)\Spybot - Search & Destroy 2\SDImmunize.exe"
& "c:\Program Files (x86)\Spybot - Search & Destroy 2\explorer.exe"
wuauclt /detectnow /updatenow
UsoClient ScanInstallWait
cd 'C:\Program Files\Classic Shell\'
.\ClassicStartMenu.exe -upgrade
pause
exit
}
pause
exit