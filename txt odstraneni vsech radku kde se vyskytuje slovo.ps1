$line_prev = ""
foreach($line in Get-Content "C:\disk_1\misa_mezera.txt")

{
    if($line -like "*2019*")
    {
 echo $line | out-file "C:\disk_1\misa_spravne_filter.txt" -Append   
    }
  #  else
  #  {
 #echo $line | out-file "D:\work\pragamedica\volani DID\zeme.txt" -Append
#    }
#    $line_prev = $line
}

#$data | Set-Content C:\sharepoint_mod_fin.txt -Force