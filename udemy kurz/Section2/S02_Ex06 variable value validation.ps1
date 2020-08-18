[validateset("y","Y","n","N")]$response = Read-host "The course instructor is Awesome. Isnt it(y/n)"


[ValidateLength(5,120)] $namew = [String](Read-host "Your name")


[ValidateRange(5,120)]$age = Read-host "Your Age? 05-120"



get-help about_Functions_Advanced_Parameters -ShowWindow

