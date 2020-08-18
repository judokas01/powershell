Get-MsolUser -All | where {$_.isLicensed -eq $true} | select-object userprincipalname | ForEach-Object {
$user = ($_.UserPrincipalName)
Get-DistributionGroupMember -Identity "pm_marketing" | Select-Object WindowsLiveID | ForEach-Object {$user2 = ($_.WindowsLiveID)
if ($user2 -eq $user) {echo "$user ano"}
else { #echo "$user not eq $user2"
}
}

}

