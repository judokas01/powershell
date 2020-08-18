#Example1: 
#Selecting all properties by wildcard(*)
 Get-Service  -Name "a*" | Format-list -property *

#Selecting few properties by name
Get-Service  -Name "a*" | Format-list -property Name,Status,DisplayName 



#Example2: Formatting Table
Get-Service  -Name "a*"  | Format-Table Name,Status

Get-Process  -Name "a*" | Format-Table Name,ProductVersion,Description -Wrap

#Top 10 processes which are taking highest CPU
 Get-Process | Sort-Object cpu -Descending | Select-Object -First 10 |
 Format-Table processname,id,cpu,ws,pm



 #Example3  ConvertTo-Html 
 Get-Process | Sort-Object CPU -Descending |
 Select-Object -First 10 | ConvertTo-Html -Property name,CPU  

 Get-Service | ConvertTo-Html -Property name, displayname, status 
 
 
 Get-Service  -Name "a*" | ConvertTo-Html | Out-File "services.html" 
 Get-Service  -Name "a*" | ConvertTo-Html -Property name,status | Out-File "services.html" 
 
 
 Get-ChildItem -Path C:\PowerShell\ -Recurse | ConvertTo-Html -Property name,fullname -CssUri myStyle.css | Out-File 'files_Report.html'
   
   
   
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

$head
$body="<h1>System's Process Information</h1>`n<h5>Updated: on $(Get-Date)</h5>"

 
 Get-Process | Select-Object -last 2 | ConvertTo-Html -Head $head -Title "ReportTitle" -Body $body | Out-File 'Process_Report.html'
 
 #Example8 ConvertTo-Csv
 #Export-CSV is the same as ConvertTo-CSV , except that it saves the CSV strings to a file.
 Get-Service -name AppMgmt | ConvertTo-Csv -Delimiter "," 
 
  
 #Example9 ConvertTo-JSON
  Get-Service -name  '*z*'  | ConvertTo-Json
  
 #Example10 ConvertTo-XML
 #This cmdlet is similar to Export-Clixml except that Export-Clixml stores the resulting XML in a file 
 # ConvertTo-XML** returns the XML, so you can continue to process it in Windows PowerShell.
  $aa  = Get-Process -Name acise | ConvertTo-Xml   
  $aa.FirstChild

 Get-Help Format-Table -ShowWindow 
 Get-Help ConvertTo-Json -ShowWindow 
 Get-Help ConvertTo-Csv -ShowWindow 
 Get-Help ConvertTo-Xml -ShowWindow 




