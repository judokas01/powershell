#nastavení PS pro O365 - exchange + pár užitečných příkazů
Set-ExecutionPolicy RemoteSigned #k tomuhle je potřeba spustit konzoli jako admin
#pak je potřeba spouštět tyhle 3 příkazy, pro připojení
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

