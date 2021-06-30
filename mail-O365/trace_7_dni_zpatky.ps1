$sender = Read-Host -Prompt 'mail Od koho to melo prijit'
$od = get-date -UFormat "%m/%d/%y"
$od = get-date -date $(get-date).adddays(-7) -format yyyy.MM.dd
$do = get-date -date $(get-date).adddays(0) -format yyyy.MM.dd
Get-MessageTrace -SenderAddress $sender -StartDate $od -EndDate $do
pause


#$mystart  -EndDate $myend | where {$_.senderaddress -like "zajicek"}