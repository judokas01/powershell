Clear-Host

#Example1: test path
if (Test-Path "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\Random_File.txt"){
    Write-Output "File Exist"
} else {
    Write-Output "File Do NOT Exist"
} 


#Example2 Reading File after verifying its existence
if (Test-Path "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\Random_File.txt"){
    Get-Content "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\Random_File.txt"

} else {
    Write-Output "File Do NOT Exist"
} 


#Example3 Using paramters to read the required text only.
#Reading from bottom
Get-Content "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\Random_File.txt" -Tail 2

#Reading a specific line
(Get-Content "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\Random_File.txt")[2]

# To read a range of lines
$file_content = (Get-Content "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\Random_File.txt")[2..5]
Write-Output "File Content is:"$file_content


# Processing the file content
$file_content | Where-Object {  $_ -like "*ERROR*"  }
$file_content | Where-Object {  $_ -like "*INFORMATION*"  }




#Select-String
$file_content | Select-String  -Pattern "Error"

"powershell","PowerShell","SHELL","Shell" | Select-String -Pattern "Shell" -CaseSensitive


Select-String -Path ".\random_file.txt" -Pattern "ERROR" 
# This can be used for multiple file search also. You just need to speicfy wild card in 
# the file name and it will search all the files for the pattern
 
 Select-String -Path ".\*.txt" -Pattern "ERROR" 
 
 
#EXPLORE SELECT-STRING IN MORE DETAIL AT YOUR OWN. USE POWERSHELL HELP FOR THE SAME.
Get-Help  Select-String -showwindow




#Creating a mini script using Try catch
Clear-Host
Try{

$file_name = "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\Random_File.txt"

        if (Test-Path $file_name){
            Write-Output "File Exist"
            $last_4_lines = Get-Content -Path $file_name -Tail 4 -ErrorAction stop -ErrorVariable 'err'
            Write-Output "As per the requirement here are the last 4 lines of your file:"
            Write-Output $last_4_lines
        } else {
             Write-Output "Hi User. File you are trying to access do not exist. Please check if it is deleted accidently"
         } 
    }catch{
        Write-Output "Something went Wrong. Error: $err"
} 


	





#Writing Some text into a file(This will create the file it does not exist already
Write-Output "$(get-date) :  This is a text  " | Out-File –FilePath output.txt 

#To append text at the end of existing file(create file only if do not exist)
Write-Output "$(get-date) :  This is a text  " | Out-File –FilePath output.txt -Append
$var= "Some random variable"
Write-Output "$(get-date) : var = $var  " | Out-File –FilePath output.txt -Append

#guess the output
Write-Output "$(get-date) : Printing line 0 " | Out-File -FilePath output.txt
Write-Output "$(get-date) : Printing line 1 " | Out-File -FilePath output.txt –Append
Write-Output "$(get-date) : Printing line 2 " | Out-File -FilePath output.txt –Append
Write-Output "$(get-date) : Printing line 3 " | Out-File -FilePath output.txt –Append
Write-Output "$(get-date) : Printing line 4 " | Out-File -FilePath output.txt –Append
Write-Output "$(get-date) : Printing line 5 " | Out-File -FilePath output.txt



