Import-Module ActiveDirectory
Get-ADComputer -Filter * | Select-Object Name | ForEach-Object { 
if (Test-Connection -Computername $_.Name -BufferSize 16 -Count 1 -Quiet) {
    Write-Host $_.Name is online
    }
}