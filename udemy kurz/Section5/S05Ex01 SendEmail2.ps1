# Details of the Login Username and SMTP server. These can very from one 
# Mail Service Provder to another
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$Username = "testingpurpose201801@gmail.com"
$Password = "TestingPurpose_forStudents"

#Add email address of person in to & cc  whom you are sending email (Multiple addresses should be comma seperated)
$to = "testingpurpose201801@gmail.com,testingpurpose201801@gmail.com"
$cc = "testingpurpose201801@gmail.com"

$subject = "Email Subject"

		
$service_to_monitor = @("VSS","WinRM","TrustedInstaller","Spooler","msiserver")


$head = @"
<style>
h1, h5, th { text-align: center; }
table { margin: auto; font-family: Segoe UI; box-shadow: 10px 10px 5px #888; border: thin ridge grey; }
th { background: #0046c3; color: #fff; max-width: 400px; padding: 5px 10px; }
td { font-size: 11px; padding: 5px 20px; color: #000; }
tr { background: #b8d1f3; }
tr:nth-child(even) { background: #dae5f4; }
tr:nth-child(odd) { background: #b8d1f3; }
</style>
"@
  


#=============================================================== 
#=============================================================== 
#=============================================================== 
$report = "system_performance.html";

#High CPU
$body="<h3>Summary of Processes taking High CPU</h3>`n<h3>Updated: on $(Get-Date)</h3>"
 Get-Process | Sort-Object cpu -Descending | Select-Object -First 10 | ConvertTo-Html -property processname,id,cpu,ws,pm `
  -Head $head -Body $body | Out-File $report 

Write-Output  "<br><br><br><br>" | Out-File $report -Append
#High Physical memory
$body="<h3>Summary of Processes taking High Physical Memory</h3>`n<h3>Updated: on $(Get-Date)</h3>"

 Get-Process | Sort-Object PM -Descending | Select-Object -First 10 | ConvertTo-Html -property processname,id,cpu,ws,pm `
-Body $body | Out-File $report -Append



#Service Monitoring
Write-Output  "<br><br><br><br>" | Out-File $report -Append
$body="<h3>Services Status</h1>`n<h3>Updated: on $(Get-Date)</h3>"

Get-Service -name $service_to_monitor | ConvertTo-Html -property Name,DisplayName,Status,ServiceType,CanPauseAndContinue `
-Body $body | Out-File $report -Append

#=============================================================== 
#=============================================================== 
#=============================================================== 


	
$BASE_DIR=(Resolve-Path .\).Path

$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.body = Get-Content $report
$message.to.add($to)
$message.cc.add($cc)
$message.IsBodyHtml = $True
$message.from = "testingpurpose201801@gmail.com"

#If needed to send file as attachment
#$attachment = $BASE_DIR + "\" +$report
#$attach_log = new-object Net.Mail.Attachment($attachment)
#$message.Attachments.Add($attachment)


$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)

# ==========================================================================================================
# ==========================================================================================================
# ==========================================================================================================