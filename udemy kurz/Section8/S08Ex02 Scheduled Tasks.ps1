
#Triggers:

#Hourly
New-JobTrigger -Once -At "05/04/2018 1:00:00" -RepetitionInterval (New-TimeSpan -Hours 1 )

#Selected days of the week
New-JobTrigger -Weekly -DaysOfWeek 1,3,5 -At 12:01AM 


New-JobTrigger -Weekly -DaysOfWeek Monday, Wednesday, Friday -At "23:00" -WeeksInterval 4




# for windows 7 and less versions 
ipmo PSScheduledJob 
$T = New-JobTrigger -Weekly -DaysOfWeek 1,3,5 -At 12:01AM 
Register-ScheduledJob -Name MyScheduledTask -FilePath "C:\runas.ps1" -Trigger $T  
 


# for windows 8 and higher versions 
ipmo ScheduledTasks 
$trigger =   New-ScheduledTaskTrigger -da -At 12AM -RepetitionInterval (New-TimeSpan -Minutes 1 )

$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument 'C:\AD\runas.ps1' 

Register-ScheduledTask -TaskName "MyScheduledTask"  -Trigger $trigger -Action $action -Description "This task will run daily and do my important stuff." 