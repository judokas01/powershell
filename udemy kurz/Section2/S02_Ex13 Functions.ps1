Clear-Host

function Say-Hello{
	Write-Output "Hello How are you doing"
	Write-Output "I hope you are doing well"
	Write-Output "Do you have any Questions?"
}

Say-Hello
Say-Hello
Say-Hello




#Example1
function Add-Numbers {
 $total = $args[0] + $args[1]

 Write-Output "Total:  $total"
}

Add-Numbers 10 2

#Example 2: Passing array as Argument
function Say-Hello($names){

    foreach ($name in $names){
        echo "Hii All! This is $name"
    }
}

$names=@("Vijay",“ABC",“DEF","XYZ")
Say-Hello $names 


#=============================================
function Say-Hello($names, $greeting_statement){

    foreach ($name in $names){
        Write-Output "Hii All! This is $name"
    }

Write-Output $greeting_statement
}

$names_array=@("Vijay",“ABC",“DEF","XYZ")
$statement = "How are you? "

Say-Hello $names $statement
#=============================================





#Example Function with named parameters

function My-Introduction
{
  param
  (
    [string]$Name,
    [String]$profession,
    [int]$age
  )
  
    Write-Output "Hello There!! My name is $Name and I am $age years old $profession"
}

My-Introduction -name "Vijay" -profession "Software Engineer" -age 25
My-Introduction -name "XYZ"  -age 19 -profession "Cricketer"
My-Introduction  -age 37 -name "ABC" -profession "Singer"
