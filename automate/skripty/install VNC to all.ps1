Import-Module ActiveDirectory
#aby šlo filtrovat AD


#vytvoření share c:\hotline\install
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo $PC
Invoke-Command -FilePath "C:\Users\simon.zajicek\Desktop\skripty\share_create.ps1" $PC
}

#nakopírování MSI do každého PC
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo $PC
 Copy-Item -Path C:\Hotline\install\tightvnc.msi -Destination "\\$PC\c$\hotline\install\tightvnc.msi"
}

#spuštění installace TightVNC serveru s heslem pro přístup root
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo $PC
Invoke-Command -FilePath "C:\Users\simon.zajicek\Desktop\skripty\install_bat.ps1" $PC
}

#odstranění share c:\hotline\install
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo $PC
Invoke-Command -FilePath "C:\Users\simon.zajicek\Desktop\skripty\share_delete.ps1" $PC
}