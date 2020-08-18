$credential = Get-Credential
$credential.Password | ConvertFrom-SecureString | Out-File C:\ESD\demoaccount.txt

cd C:\ESD
. .\Functions-PSStoredCredentials.ps1
New-StoredCredential