#Example1 : Select-Object
Get-Service | Select-Object  -First 5



Get-Process | Select-Object  -Last 5



Get-Process | Get-Member

Get-Process | Select-Object  -Property BasePriority,CPU,Name



Get-Process | Select-Object  -Property *



Get-Process -Name "*a*" | Select-Object -First 2







#Example2 : Where-Object
Get-Process | Where-Object { $_.CPU -ge 1000 }





#We can ut place multiple Where-Object, If cmdlet is not fitting in one line, We can always break the statement after pipe
Get-Service | Where-Object { $_.Name -like '*a*' } | Where-Object {$_.Status -eq 'Stopped'} | 
 Select-Object -First 3









#Example3 : Group-Object
Get-Service | Group-Object -Property ServiceType 





#Example4 : Sort-Object
Get-Process | Sort-Object BasePriority | Group-Object -Property BasePriority 

Get-Process | Sort-Object BasePriority | Group-Object -Property BasePriority | Select-Object -Last 1

Get-Process | Sort-Object BasePriority | Group-Object -Property BasePriority | Select-Object -Last 1 -ExpandProperty group






# Find Top 10 process which are consuming highest CPU
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

# Find Top 10 process which are consuming highest Physical Memory
Get-Process | Sort-Object PM -Descending | Select-Object -First 10






#Example5 : ForEach-Object
#Performs an operation against each item in a collection of input objects.
Get-Process | ForEach-Object{
    Write-Host "Processinig : Doing Something on " $_.Name
}


1..10 | ForEach-Object {
    echo "Hello World"
}


Get-ChildItem -Path C:\PowerShell\Advanced_PowerShell -Recurse  | ForEach-Object {
    echo $_.FullName
}




#Solving a practical problem
# Delete all the files older than 10 days from a directory. Do not delete subfolders.


$purge_dir = "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section4\TestFiles"
$retention_days = 10

Get-ChildItem -File -Recurse $purge_dir | 
    Where-object {$_.LastWriteTime -lt (get-date).adddays(-$retention_days)} | % { 
               $_.fullname | del -Force     -WhatIf                   # Deleting the file 
}

