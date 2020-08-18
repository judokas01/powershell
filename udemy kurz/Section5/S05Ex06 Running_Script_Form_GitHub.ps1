
#Invoke-Expression:

$Command = 'Get-Process | where {$_.cpu -gt 1000}'
$Command

Invoke-Expression $Command 








#
# Script Owner: Vijay Saini
# Developed on: 12th August 2018
#


Write-Host "===================================================="
$Celsius = [double](Read-Host "Enter temperature in Fahrenheit")

#Caluclating temperature in $Kelvin
$Kelvin = $Celsius  + 273.15
Write-Verbose "$Celsius degree Celsius is equivalent to $Kelvin K" -Verbose

Write-Host "FYI: Top 5processes using maximum PM of your computer:" -BackgroundColor DarkBlue -ForegroundColor red
Get-Process | Sort-Object PM -Descending | Select-Object -First 5


#
#########################################

$ScriptFromGithHub = Invoke-WebRequest https://raw.githubusercontent.com/SainiVijayProgram/MyPoweShellGang/master/Running_Script_Form_GitHub.ps1

$ScriptFromGithHub.Content

Invoke-Expression $ScriptFromGithHub.Content