Clear-host
#Operator -eq
2 -eq 2
"abc" -eq "abc"




#Operator -ne
"abc" -ne "def"





#Operator -lt
5 -lt 10

7, 8, 9 -le 8
# Similar -ge , -gt





#Operator: -like <string[]> -like <wildcard-expression>
"PowerShell" -like "*shell"

#Operator: -notlike Does not match using the wildcard character (*)
"PowerShell" -notlike "*Shell"

#More Operators  -clike , -cnotlike

#More Example:
@(	
"This is a line about XYZ Country",
"This is a line about ABC Country",
"This is a line about SSS Country"

) -like "*SSS*"
{OR}
"This is a line about XYZ Country", "This is a line about ABC Country",  "This is a line about SSS Country" -like "*SSS*"



#Operator -match: Matches a string using regular expressions.
#If the input is a collection, the -match and -notmatch operators 
#return the matching members of that collection, but the operator
# does not populate the $Matches variable.

"Sunday" -match "sun"
$matches


"Sunday", "Monday", "Tuesday" -match "sun"
$matches





#Operator: -contains and -notcontains
#The containment operators (-contains and -notcontains) 
#are similar to the equality operators. However, 
#the containment operators always return a Boolean value, even when the input is a collection.

"Windows", "PowerShell" -contains "Shell"
"abc", "def" -contains "def"
"Windows", "PowerShell" -notcontains "Shell"




  Get-Help about_Comparison_Operators -ShowWindow
   