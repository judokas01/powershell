# method 1: Once, we have declared variable as Integer type, we cannot change its type again.
[int]$x=100 
$x.GetType()

#Below line will throw an error
$x = "a String Value"

#Method2: We can re-use the same variable again & again with different data types
$y=[int]100 
$y.GetType()
$y = "a String Value"
$y.GetType()





#Advantage:
$date_string = "01/26/2018"
[DateTime]$date_string = $date_string 
$date_string

$date_string.GetType()



#Validate data type
$a_var = 1000
$a_var -is [int]
$a_var -is [String]


$string_var = "String"
$string_var -is [int]
$string_var -is [String]
