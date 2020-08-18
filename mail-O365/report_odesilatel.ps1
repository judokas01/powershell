#$UserCredential = Get-Credential
#$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
#Import-PSSession $Session -DisableNameChecking
#report - historický search v mailech
$jmeno_reportu = Read-Host -Prompt 'nazev reportu'
$od = Read-Host -Prompt 'od kdy? (ve formátu MM/DD/YYYY) max 90 dní ode dneška'
$do = Read-Host -Prompt 'do kdy? (ve formátu MM/DD/YYYY)'
$odesilatel = Read-Host -Prompt 'mail odesílatele'
$mail = Read-Host -Prompt 'mail, kam poslat report'
#Start-HistoricalSearch -reportTitle enriquieies -StartDate 9/1/2018 -EndDate 10/1/2018 -reporttype MessageTrace -SenderAddress enquiries@fertilityclinicsabroad.com -NotifyAddress zajicek@pragamedica.com

Start-HistoricalSearch -reportTitle $jmeno_reportu -StartDate $od -EndDate $do -reporttype MessageTrace -SenderAddress $odesilatel -NotifyAddress $mail
pause
