Clear-Host

#Example1
 If (10 -eq 10) {
    "True"
} else{
    "False"
}





#Example2
[int]$num1 = Read-Host "Enter a number"
[int]$num2 = Read-Host "Enter another number"
 If ($num1 -eq $num2) {
    "You entered $num1"
} else{
    "You entered $num1 and $num2 and they are not equal"
}



#Example4 -NOT
[int]$num = Read-Host "Enter a number"
#-not is used for reversal of If logic
if  (  -not ($num -le 100) ){
	Write-Output "Entered number $num is NOT less than 100"
} 






#Nested If Else loop
[int]$num = Read-Host "Enter a number"
if (  ($num -gt 100) {
	if ($num -lt 1000){
			Write-Output "Entered number $num is somewhere between 100 and 1000"
	}
} else {
Write-Output "Entered number is not is in the valid range "
}



#Example5
#If else with multiple conditional statements -AND
[int]$num = Read-Host "Enter a number"

#If & Only If both condition are True, PowerShell will execute the block
if (  ($num -gt 100)  -and ($num -lt 1000) ){
	Write-Output "Entered number $num is somewhere between 100 and 1000"
} else {
	Write-Output "Entered number is not is in the valid range "
}





#Example6
#If else with multiple conditional statements -OR
#If one of the condition is True, PowerShell will execute the block
[int]$num = Read-Host "Enter a number"
if (  ($num -gt 100)  -or ($num -lt 1000) ){
	Write-Output "Entered number $num is somewhere between 100 and 1000"
} else {
	Write-Output "Entered number is not is in the valid range "
}









#Example3
[int]$num = Read-Host "Enter a number"

 If ($num -eq 10) {
    "You entered $num is equal to 10"
} elseif($num -eq 100){
   "You entered $num is equal to 100"
}elseif($num -eq 1000){
    "You entered $num is equal to 1000"
}else{
   "You entered $num is not 10,100 or 1000"
}




#Switch to Switch statement if you do not want to see something like this in your code
if(-condition-){
	- statement
}elseif(){
	- statement
}elseif(){
	- statement
}elseif(){
	- statement
}elseif(){
	- statement
}elseif(){
	- statement
}elseif(){
	- statement
}elseif(){
	- statement
}else {
}



