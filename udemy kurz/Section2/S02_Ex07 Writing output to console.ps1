Clear-Host
Write-Host "Hello There! I am feeling awesome"
Write-Host "I hope yoy are enjoying the scripting" -ForegroundColor Cyan 
Write-Host "I can say, I am loving to present this content to you" -ForegroundColor green -BackgroundColor red


Write-Output "This is  Output message"

Write-Error "This is a Error message"
Write-Warning "This is  Warning message" 

Write-Debug "This is Debug message" -Debug
Write-Verbose "This is VERBOSE" -Verbose






#Write-Host vs others
Write-Output "Hello" | Get-Member
Write-Host "Hello" | Get-Member

	
	
$var_host = Write-host "Hello"
$var_host
$var_output = Write-Output "Hello"
$var_output
