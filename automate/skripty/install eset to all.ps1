Import-Module ActiveDirectory
#aby šlo filtrovat AD


#vytvoření share c:\hotline\install
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo "otevreni share na $PC"
Invoke-Command -FilePath "C:\Users\simon.zajicek\Desktop\skripty\share_create.ps1" $PC
}

echo "share otevřeny jdu na kopírováí"

#nakopírování MSI do každého PC
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo "kopírování dat na $PC"
 Copy-Item -Path C:\Hotline\install\eea_nt64.msi -Destination "\\$PC\c$\hotline\install\eea_nt64.msi"
}

echo "instalačky nakopírovány jdu na instalace..."

#spuštění installace TightVNC serveru s heslem pro přístup root
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo "instalace probíhá na... $PC"
Invoke-Command -FilePath "C:\Users\simon.zajicek\Desktop\skripty\install_eset_bat.ps1" $PC
}

echo "instalace proběhly/neproběhly jdu na zavírání share..."

#odstranění share c:\hotline\install
get-ADCOmputer -Filter * | Select-Object Name -skip 4 | ForEach-Object{
$PC = echo $_.Name
echo "zavírám share na $PC"
Invoke-Command -FilePath "C:\Users\simon.zajicek\Desktop\skripty\share_delete.ps1" $PC
}