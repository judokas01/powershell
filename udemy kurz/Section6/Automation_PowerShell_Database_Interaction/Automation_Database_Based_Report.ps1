#  Script Name : Automation_Database_Based_Report.ps1
#
#  Developed By: Vijay Saini
#  Scripting Language : PowerShell
#
#  Date : 12th March 2018
#
#  Purpose : To Read database and prepare a html report and send it to the stake holders
#
#  Author  : Vijay Saini
#
#             

#Setting up variables
$BASE_DIR=(Resolve-Path .\).Path

$LOG_FILE=$BASE_DIR + "\daily_server_status_report.log"

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
$report=$BASE_DIR + "\daily_status.html"

$xml_config=$BASE_DIR + "\configuration.xml"
[xml]$xml_content=Get-Content $xml_config


write-output "$(get-date) :INFO Staring the script Execution " | out-file $LOG_FILE -Append -Force;  

$db_host = $xml_content.DAILY_REPORT.DATABASE_DETAILS.HOST
$db_database = $xml_content.DAILY_REPORT.DATABASE_DETAILS.DATABASE
$db_username = $xml_content.DAILY_REPORT.DATABASE_DETAILS.USERNAME
$db_password = $xml_content.DAILY_REPORT.DATABASE_DETAILS.PASSWORD

$db_query = $xml_content.DAILY_REPORT.REPORT_QUERIES.QUERY




#==================================Preparing  Report=======================================================

	Try{
		$connectionString= "Data Source=$db_database;User Id=$db_username;Password=$db_password;   Integrated Security=no"
		[System.Reflection.Assembly]::LoadWithPartialName("System.Data.OracleClient")

		$connection = New-Object  System.Data.OracleClient.OracleConnection($connectionString)
		
			$connection.open()
		
				$queryString = $db_query
				$command = new-Object System.Data.OracleClient.OracleCommand($queryString, $connection)
				
				write-output "$(get-date) :Executing queryString: $queryString " | out-file $LOG_FILE -Append -Force; 
				
				$command=$connection.CreateCommand()
				$command.CommandText=$queryString

				$DataTable_Temp = New-Object System.Data.DataTable
				
				$reader=$command.ExecuteReader()
				$DataTable_Temp.Load($reader)
				 

                $body="<h3>Daily Summary</h3>`n<h3>Updated: on $(Get-Date)</h3>"
                $DataTable_Temp | ConvertTo-Html -property ip_address,server_name,os_version,status -Head $head -Body $body | Out-File $report 
                

			
	}Catch{

		$ErrorMessage = $_.Exception.Message
		write-output "$(get-date) :ERROR Something went Wrong ErrorMessage :  $ErrorMessage " | out-file $LOG_FILE -Append -Force; 
	} finally{
	
		write-output "$(get-date) :Closing the database connection " | out-file $LOG_FILE -Append -Force; 
		$connection.close()
	}

write-output "$(get-date) :INFO Report Preparation Execution Over" | out-file $LOG_FILE -Append -Force; 

#==================================Report Prepared=======================================================




#==================================SENDING EMAIL=======================================================
Try{
	$SMTPServer = $xml_content.DAILY_REPORT.EMAIL.SMTP
	$Username = $xml_content.DAILY_REPORT.EMAIL.SMTP_USERNAME
	$Password = $xml_content.DAILY_REPORT.EMAIL.SMTP_PASSWORD

	$message = New-Object System.Net.Mail.MailMessage
	$message.subject = $xml_content.DAILY_REPORT.EMAIL.SUBJECT
	$message.body = Get-Content $report
	$message.to.add( $xml_content.DAILY_REPORT.EMAIL.TO )
	$message.cc.add($xml_content.DAILY_REPORT.EMAIL.CC)
	$message.IsBodyHtml = $True
	$message.from = $xml_content.DAILY_REPORT.EMAIL.FROM

	#If needed to send some file as attachment
	#$attachment = $BASE_DIR + "\" +$report
	#$attach_log = new-object Net.Mail.Attachment($attachment)
	#$message.Attachments.Add($attachment)


	$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
	$smtp.EnableSSL = $true
	$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
	$smtp.send($message)
	write-output "$(get-date) :INFO Email Sent" | out-file $LOG_FILE -Append -Force; 
	
} catch {

	$ErrorMessage = $_.Exception.Message
	write-output "$(get-date) :ERROR Something went Wrong.  ErrorMessage :  $ErrorMessage " | out-file $LOG_FILE -Append -Force; 
		
} finally{
		write-output "$(get-date) : Script Execution Completed " | out-file $LOG_FILE -Append -Force; 
	
}
#==================================SENDING EMAIL Completed=======================================================



