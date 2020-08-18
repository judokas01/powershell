#Ex01 Add-Two

#Function Body
function Add-Numbers{

param($num1, $num2)

Write-Host ($num1 + $num2)
}

# Calling the function with arguments
 Add-Numbers  12 19
 Add-Numbers  "Str1 " "Str2 "


















#Ex02 --Adding type
function Add-Numbers{

param(
    [int]$num1, 

    [int]$num2
    )

Write-Host ($num1 + $num2)
}

# Calling the function with arguments
 Add-Numbers  12 19
 Add-Numbers  "Str1 " "Str2 "

 #Calling function with one argument
 Add-Numbers  120













#Ex03 Enabling advanced features using cmdletbinding
cls
function Add-Numbers{
[cmdletbinding()]
param(
    [int]$num1, 

    [int]$num2
    )

Write-Verbose "Performing some really complex calculation"
Write-Host ($num1 + $num2)
Write-Debug "Calculation completed" 

}

Add-Numbers 567 43 -Verbose -
Add-Numbers 567 32 -Debug
Add-Numbers 567 32 -ErrorAction SilentlyContinue 












#Ex04 Adding type, manadatory paramter
function Add-Numbers{
[cmdletbinding()]
param(
    [parameter(Mandatory=$true)]
    [int]$num1, 

    [parameter(Mandatory=$true)]
    [int]$num2
    )


Write-Verbose "Performing some really complex calculation"
Write-Host ($num1 + $num2)
Write-Debug "Calculation completed" 

}

# Calling the function with arguments
 Add-Numbers  12 19 
 Add-Numbers  100
  Add-Numbers  100 200 -Verbose












#Ex05 Adding type, manadatory paramter, Help Message
function Add-Numbers{
[cmdletbinding()]
param(
    [parameter(Mandatory=$true,
            HelpMessage="Please pass the first number to add")]
    [int]$num1, 

    [parameter(Mandatory=$true,
         HelpMessage="Please pass the second number to add")]
    [int]$num2
    )


Write-Verbose "Performing some really complex calculation"
Write-Host ($num1 + $num2)
Write-Debug "Calculation completed" 

}

# Calling the function with arguments
 Add-Numbers  12 19 
 Add-Numbers  100
 Add-Numbers  100 200 -Verbose