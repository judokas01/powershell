
Import-Module ActiveDirectory
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{

$testSession = New-PSSession -Computer $_.Name
if(-not($testSession))
{

Write-Warning "$_.Name inaccessible!"
echo $_.Name | out-file \\alfa\Hotline_users\CO\V3\not.txt -append
}

else
{
    
Write-Host " Going to .. $_.Name "
echo $_.Name | out-file \\alfa\Hotline_users\CO\V3\yes.txt -append
$PC = (echo $_.Name)
echo $PC
Invoke-Command -FilePath "\\alfa\Hotline_users\CO\V3\remote.ps1" $PC

}
}

