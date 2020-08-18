#samotny filter
#Get-MsolUser -All | where {$_.department -eq IVF}  | Select-Object * #FirstName, Lastname, DisplayName, UserPrincipalName, Department, Title |  ft -hidetableheaders


Get-MsolUser -all | where department -EQ "COSMETIC" | Select-Object UserPrincipalName | ForEach-Object {
Set-CasMailbox -Identity $_.UserPrincipalName -OWAEnabled $false
#echo $_.UserPrincipalName
} 
