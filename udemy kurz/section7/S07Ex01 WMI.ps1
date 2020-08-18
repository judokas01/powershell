#Get the list of namespaces
gwmi -namespace "root" -class "__Namespace" | Select Name

#To get all the classes from a namespace
Get-WmiObject -Namespace 'root\cimv2' -List
(Get-WmiObject -Namespace 'root\cimv2' -List).count
Get-WmiObject -Namespace 'root\cimv2' -List | Out-GridView



#Fetching all properties by class name
Get-WmiObject -Class 'Win32_Service'

#Fetching results by a Query
Get-WmiObject  -Query "select * from Win32_Service" 



#WMI on remote machines
Get-WmiObject -Class 'Win32_Service' -ComputerName 'localhost'

#Fetching results by a Query
Get-WmiObject -ComputerName 'localhost' -Query "select * from Win32_Service" 


Get-WmiObject  -Query "select * from Win32_Service where State = 'Running'" 



#Get disk srives
Get-WmiObject -Class 'Win32_LogicalDisk' -ComputerName 'localhost' 



#Get Different Drives using WMI:
Get-WmiObject -Class 'Win32_LogicalDisk' -ComputerName 'localhost'  -Filter "DriveType=3"
#{OR}
Get-WmiObject  -Query "select * from Win32_LogicalDisk where DriveType=3" -ComputerName 'localhost' 

# To get the information about operating system
Get-WmiObject  -Query "select * from Win32_OperatingSystem" -ComputerName 'localhost'  | Out-GridView


# to get the information about different processes running on a remote machine
Get-WmiObject  -Query "select * from Win32_Process" -ComputerName 'localhost'  | Out-GridView

# to get the information about Physical memory
Get-WmiObject  -Query "select * from win32_PhysicalMemory" -ComputerName 'localhost' | Out-GridView


# to get the information about computer system
Get-WmiObject  -Query "select * from Win32_ComputerSystem" -ComputerName 'localhost' | Out-GridView

