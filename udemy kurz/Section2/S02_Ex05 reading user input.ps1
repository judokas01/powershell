Clear-Host

#Way1 Only reading the user inputs

$name = Read-host "What is your name"
$age = Read-host "What is your age"
$date = Read-host "What is the date on which you are taking this course? date-Format: mm/dd/yyyy"
$response = Read-host "The course nstructor is Awesome. Isnt it(y/n)"
$password = Read-host "Enter Your password" 

Echo "********Data received**********"
echo "Your name is: $name"
echo "Your age is: $agw"
echo "Date: $date"
echo "Response: $response"
echo "Password: $password"


#Way2 Reading & validating the user input

[string]$name = Read-host "What is your name"
[int]$age = Read-host "What is your age"
[Datetime]$date = Read-host "What is the date on which you are taking this course? date-Format: mm/dd/yyyy"
[char]$response = Read-host "The course nstructor is Awesome. Isnt it(y/n)"
$password = Read-host "Enter Your password" -AsSecureString

Echo "********Data received**********"
echo "Your name is: $name"
echo "Your age is: $age"
echo "Date: $date"
echo "Response: $response"
echo "Response: $password"

#Data  types:
$name.GetType()
$age.GetType()
$date.GetType()
$response.GetType()
$password.GetType()
