
Import-Module ActiveDirectory
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{

$testSession = New-PSSession -Computer $_.Name
if(-not($testSession))
{

Write-Warning "$_.Name inaccessible!"
echo $_.Name | out-file C:\Users\simon.zajicek\Desktop\skripty\not.txt -append
}

else
{
    
Write-Host " Going to .. $_.Name "
echo $_.Name | out-file C:\Users\simon.zajicek\Desktop\skripty\yes.txt -append
$PC = (echo $_.Name)
echo $PC
Invoke-Command -FilePath "C:\Users\simon.zajicek\Desktop\skripty\remote.ps1" $PC

}
}

