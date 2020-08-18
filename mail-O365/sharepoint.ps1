Connect-SPOService -Url https://pragamedica-admin.sharepoint.com

Get-SPOUser -site https://pragamedica.sharepoint.com | Select-Object * | out-gridview

Get-SPOSite | ForEach {Get-SPOSiteGroup -Site $_.Url} | Format-Table


Get-SPOSite | ForEach {Get-SPOUser -Site $_.Url}