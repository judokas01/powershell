dir | ForEach-Object {
$name = $_.Name
echo $name

$data = foreach($line in Get-Content $name)
{<#
    if($line -like '*bytes=*' -and $prev_line -like '*bytes=*')
    { 
           
$prev_line = $line
    }

    if($line -like '*bytes=*' -and $prev_line -notlike '*bytes=*')
    { 
    echo $line       
$prev_line = $line
    }

    if($line -notlike '*bytes=*' -and $prev_line -notlike '*bytes=*')
    { 
       
$prev_line = $line
    }

    if($line -notlike '*bytes=*' -and $prev_line -like '*bytes=*')
    { 
    echo $line       
$prev_line = $line
    }
    #>
    if($line -like '*bajty=*' -and $prev_line -like '*bajty=*')
    { 
           
$prev_line = $line
    }

    if($line -like '*bajty=*' -and $prev_line -notlike '*bajty=*')
    { 
    echo $line       
$prev_line = $line
    }

    if($line -notlike '*bajty=*' -and $prev_line -notlike '*bajty=*')
    { 
       
$prev_line = $line
    }

    if($line -notlike '*bajty=*' -and $prev_line -like '*bajty=*')
    { 
    echo $line       
$prev_line = $line
    }

    }

$file = echo "vysledek_${name}"
$data | out-file $file -Force
}


