#Example:
$ErrorActionPreference = "Stop"
$UpdatedList_GenuineEmployees = Get-Content \\FileServer\HRDepartment\CompanyEmployees.txt
$CurrentEmployees = Get-MyEmployees # Some cmdlete(example only) which returns the List of current employees
 
Foreach($emp in $CurrentEmployees)
{
    If($UpdatedList_GenuineEmployees -notcontains $emp)
    {		
         Delete-Employee $emp   # passing employee as argument to delete from the database
    } else{
		Update-Employee $emp "Genuine" # passing employee as argument to update as "Genuine" in the database
	}
}



Write-Error "Write this error first" -ErrorAction Stop


If you specify -ErrorAction Stop on any advanced function or Cmdlet, it will turn all Write-Error statements into terminating errors that will stop execution or that can be handled by a catch.

Do-Something -ErrorAction Stop


#Example1: ErrorActionPreference
#test Command
Get-Service -ComputerName 'localhost' -Name 'BITS'

$ErrorActionPreference = 'Error'
Get-Service -ComputerName 'localhost' -Name 'BITSs'

$ErrorActionPreference = 'Silentlycontinue'
Get-Service -ComputerName 'localhost' -Name 'BITSs'

#Example2 ErrorAction
Get-Service -ComputerName 'localhost' -Name 'BITSs' -ErrorAction SilentlyContinue
#{OR}
Get-Service -ComputerName 'localhost' -Name 'BITSs' -EA SilentlyContinue

#Example3 ErrorVariable
Get-Service -ComputerName 'localhost' -Name 'BITSs' -ErrorAction SilentlyContinue -ErrorVariable "err"
#{OR}
Get-Service -ComputerName 'localhost' -Name 'BITSs' -EA SilentlyContinue -EA "err"

Write-Output "Error in last command:  $err"




#Example Try Catch Block
#$need_help_for = "get-help 
$file= Get-content "ImportantData.txt"

 try{
 
    Get-Help $need_help_for -ErrorAction Stop -ErrorVariable "err"

 }catch{
    $ErrorMessage = $_.Exception.Message
    $ErrorMessage
    Write-Host "Sorry. The cmdlet( $need_help_for)  you are looking for help do not exist " -ForegroundColor Yellow
    Write-Host "Err: $err" -ForegroundColor Yellow
	
	#SEND EMAIL TO HR TEAM
} 
 

 
 
#Throw Exception at our own
throw "This thing went wrong. Please check blah blah blah ... "




#Example: Multiple catch block and finally
$file_name = "ImportantData.txta"

 try{
    Write-Output "Reading File"
    Get-Content $file_name -ErrorAction Stop -ErrorVariable "err"

 }catch [System.IO.FileNotFoundException]
{        
    Write-Output "File not avilable at $path"
}
catch [System.IO.IOException]
{
     Write-Output "Input/Output error with the file: $path"
}catch{
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName

    Write-Host "Sorry. The file ( $file_name)  you are looking for help do not exist " -ForegroundColor Yellow
    Write-Host "FailedItem : $FailedItem " -ForegroundColor red
    Write-Host "Err: $err" -ForegroundColor Yellow
} finally{
	Write-Host "An attempt to access the file($file_name) was made at $(Get-date)" -ForegroundColor green
}
 



#If using Try Catch inside Loops
# Break Statement
#The break statement terminates the loop (for, while and do...while loop) immediately when it is encountered. The break statement is used with decision making statement such as if...else.
#Break - Exit a program loop


#continue Statement
#The continue statement skips some statements inside the loop. The continue statement is used with decision making statement such as if...else.
#Return to top of a program loop, skip just this iteration of the loop.


