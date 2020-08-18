Get-Mailbox vision@pragamedica.com | select -ExpandProperty emailaddresses | Select-String -Pattern "smtp"

Set-Mailbox ivf@pragamedica.com -EmailAddresses @{Add='quotes_ivf@pragamedica.com'}