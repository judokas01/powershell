#pripojeni
#$UserCredential = Get-Credential
#Connect-MsolService -Credential $UserCredential
#$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
#Import-PSSession $Session -DisableNameChecking

#samotny filter
Get-MsolUser -All | where {$_.isLicensed -eq $true}  | Select-Object Department,FirstName, Lastname, userprincipalname | Sort-Object Department > c:\GM\export.txt
 #, DisplayName, UserPrincipalName, Department, Title |  ft -hidetableheaders
