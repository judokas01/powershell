$LOG_FILE = 'C:\PowerShell\Advanced_PowerShell\Practice Lab\Section8\Service_log.log'

$computer_name='localhost'
$service_name = 'Winmgmt'

$current_status=(get-service -ComputerName $computer_name -Name $service_name).Status
		If ( $current_status -like "Stopped"){

			write-output "$(get-date) :INFO Service was found in stopped status " | out-file $LOG_FILE -Append -Force; 
            
			write-output "$(get-date) : Starting the service " | out-file $LOG_FILE -Append
			
			(get-service -ComputerName $computer_name -Name $service_name).Start()
		
		} else {
			write-output "$(get-date) : Service is up and running fine " | out-file $LOG_FILE -Append
			write-output "$(get-date) : No Action required " | out-file $LOG_FILE -Append
			
		}
		
		