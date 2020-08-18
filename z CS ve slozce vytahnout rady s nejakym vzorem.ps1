cd C:\PM-mydivert
dir | ForEach-Object {$name = (echo $_.Name)
$content = (Get-Content $name) 
foreach($line in [System.IO.File]::ReadLines("C:\PM-mydivert\$name")){
if ($line -like "*out*"){
$line | out-file C:\PM-mydivert\hide\out.txt -Append
}
elseif ($line -like "*in*")
{$line | out-file C:\PM-mydivert\hide\in.txt -Append}

else 
{ $line | out-file C:\PM-mydivert\hide\rest.txt -Append}
}}

