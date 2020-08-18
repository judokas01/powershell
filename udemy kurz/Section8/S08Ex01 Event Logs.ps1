#Get-EventLog 


Get-Help Get-EventLog -Online

#List differnt types of log available
Get-EventLog -List


#Get event logs 
Get-EventLog -Newest 5 -LogName "Application"


# Store the event logs in a PowerShell array
$Events = Get-Eventlog -LogName Application -Newest 10

#and use the array as per your need
$Events | Group-Object -Property source -noelement | Sort-Object -Property count -Descending



#Gget only Error type messages from a particular type of log
Get-EventLog -LogName "System" -EntryType Error -Newest 10


# Read specific events by filtering
Get-EventLog -Log "Application" -Source "Outlook" | where {$_.eventID -eq 34}





# Get all messages between a selected time range

$endTime = Get-Date #Present time
$startTime = $endTime.AddHours(-1) # last 1 hour
<#

$startTime = $endTime.AddDays(-1) # last 1 day

$startTime = $endTime.AddMinutes(-1) # last 1 minute
#>

Get-EventLog -Log "Application" -EntryType Error -After $startTime -before $endTime

# Save the output to HTML/CSS and send in email
Get-EventLog -Log "Application" -EntryType Error -After $startTime -before $endTime | ConvertTo-Html Index, Source, Time, Message >> Out.html




# Read event logs of remote computers
Get-EventLog -LogName "Windows PowerShell" -ComputerName "localhost", "localhost2", "localhost3"



# Reading the event logs using WMI

Get-WmiObject -class Win32_NTLogEvent


$Log_message = Get-WmiObject -class Win32_NTLogEvent -filter "(logfile='Application') AND (type='error')"  | Select-Object -First 4
$Log_message | Format-Table EventCode, EventType, Message -auto


Get-WmiObject -Query "Select * from Win32_NTLogEvent where logfile='Application' AND (type='error')"| Select-Object -First 4




#Register source to an existing event log and write
New-EventLog -LogName 'Application' -Source "My Script"
Write-EventLog –LogName 'Application' –Source "My Script" –EntryType Error –EventID 1  –Message "This is a test message"


#Create a new log to register the source and then write
New-EventLog  -LogName "MyApp_Log" -Source "MyApp" -MessageResourceFile "C:\MyApp_Log.dll" 
Write-EventLog –LogName 'MyApp_Log' –Source "MyApp" –EntryType Error –EventID 1  –Message "This is a test message"

