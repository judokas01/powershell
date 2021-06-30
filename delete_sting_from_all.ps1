Set-Location "c:\xampp\htdocs\moodle_theme\theme\mb2nl\"
$to_delete = ''

 Get-ChildItem -Recurse |Select-Object  FullName | ForEach-Object {
#Write-Output $_
$realName = $_
$tempName =  $realName.FullName + '.tmp'
Write-Output $realName
        foreach($line in Get-Content $realName.FullName ){
            $line | out-file $tempName -Append
       
                <#    if($line -cnotlike ''){
                    
                    }
                
                #>
            } 
            
            Move-Item $tempName $realName.FullName -Force
 }