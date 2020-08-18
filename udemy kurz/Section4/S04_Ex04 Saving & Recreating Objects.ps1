Get-Process | Select-Object -Last 4  | Export-Clixml 'process_object.xml'


Import-Clixml process_object.xml | Select-Object -Last 2


$saved_processes = Import-Clixml process_object.xml