$od = Read-Host -Prompt 'od kdy? (ve formátu MM/DD/YYYY hh:mm:ss)'
$do = Read-Host -Prompt 'do kdy? (ve formátu MM/DD/YYYY hh:mm:ss)'
$zprava = Read-Host -Prompt 'Zpráva?'
$kdo = Read-Host -Prompt 'Jaký uživatel? (cely mail)'

Set-MailboxAutoReplyConfiguration -Identity $kdo -AutoReplyState Scheduled -StartTime $od -EndTime $od -InternalMessage $zprava #-ExternalMessage $zprava