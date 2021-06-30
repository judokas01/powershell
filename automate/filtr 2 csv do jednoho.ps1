$tabulka = Import-Csv "C:\work\link 2\eDOfinance\edo_excely\Nela\Tabulka_csv.csv" -Delimiter ";"
$AML = Import-Csv "C:\work\link 2\eDOfinance\edo_excely\Nela\AML_csv.csv" -Delimiter ";"

$AML | ForEach-Object {
$row = $_
     $row | Export-Csv "C:\work\link 2\eDOfinance\edo_excely\Nela\spojeno.csv" -Delimiter ";" -Encoding Default -Append
     $IC = $row.{IC} 
     $tabulka | ForEach-Object {
        if ($IC -match $_.IC){
            $_ | Export-Csv "C:\work\link 2\eDOfinance\edo_excely\Nela\spojeno.csv" -Delimiter ";" -Encoding Default -Append
            }

        }
 }