#$UserCredential = Get-StoredCredential -UserName zajicek@pragamedica.com
#Connect-MsolService -Credential $UserCredential
#$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
#Import-PSSession $Session -DisableNameChecking

Get-Mailbox -ResultSize Unlimited |

  Get-MailboxStatistics |

  Select DisplayName,StorageLimitStatus, `

  @{name=”TotalItemSize (GB)”; expression={[math]::Round( `

  ($_.TotalItemSize.ToString().Split(“(“)[1].Split(” “)[0].Replace(“,”,””)/1GB),2)}}, `

  ItemCount |

  Sort “TotalItemSize (GB)” -Descending | Out-File C:\powershell\report.txt

$ToAddress = 'zajicek@pragamedica.com'
$FromAddress = 'zajicek@pragamedica.com'
$SmtpServer = 'smtp.office365.com'
$SmtpPort = '587'
#$report = Get-Content C:\powershell\report.html
[string]$report = Get-Content ("C:\powershell\report.txt")

$mailparam = @{
To = $ToAddress
From = $FromAddress
Subject = 'test report'
Body = $report
SmtpServer = $SmtpServer
Port = $SmtpPort
Credential = $UserCredential
}

Send-MailMessage @mailparam -UseSsl