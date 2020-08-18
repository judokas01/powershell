foreach($user in [System.IO.File]::ReadLines("C:\PODPISY_SMLINK\user_lists\nemecky.txt"))
{$kdo = (Get-MsolUser -search "$user"| Select-Object Displayname, Title, state, department)
$kdo
$titul = Read-Host -Prompt 'Titul'
Set-MsolUser -UserPrincipalName "$user" -country $titul
}