#velikost mailboxů
get-mailbox | Get-MailboxStatistics | Select-Object Displayname, Totalitemsize | Out-File D:\work\pragamedica\velikostmailboxu.txt -Append

#velikost shared mailboxů	
get-mailbox -filter {RecipientTypeDetails -eq "SharedMailbox"}| Get-MailboxStatistics | Select-Object Displayname,totalitemsize | Out-File D:\work\pragamedica\velikostmailboxu.txt -Append

#velikost složek mailboxů	
#Get-MailboxFolderstatistics -identity IVF@pragamedica.com | Select-Object name, foldersize