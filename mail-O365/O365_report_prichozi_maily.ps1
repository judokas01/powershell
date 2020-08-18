#nastavení PS pro O365 - exchange + pár užitečných příkazů
#Set-ExecutionPolicy RemoteSigned #k tomuhle je potřeba spustit konzoli jako admin
#pak je potřeba spouštět tyhle 3 příkazy, pro připojení
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

#report - historický search v mailech
Start-HistoricalSearch -reportTitle enriquieies -StartDate 9/1/2018 -EndDate 10/1/2018 -reporttype MessageTrace -SenderAddress enquiries@fertilityclinicsabroad.com -NotifyAddress zajicek@pragamedica.com

#kolik přišlo mailů od tohohle týpka (jen to funguje za posledních 7 dní)
Get-MessageTrace -SenderAddress enquiries@fertilityclinicsabroad.com -