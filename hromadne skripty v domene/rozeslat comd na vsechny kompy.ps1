Import-Module ActiveDirectory
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo $PC
Invoke-Command -FilePath "C:\Users\simon.zajicek\Desktop\vnc_install.ps1" $PC
}


