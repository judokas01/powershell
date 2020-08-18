#Example1 While Loop
 $i =500

While ($i -le 100) {
    Write-Output "value if variable i: $i"; 
    $i +=5  # this is similar to    $i = $i + 1 

} 

Write-output "Out of the loop and proceeding with further statements in script"





#Example2 Do While Loop
$i = 10
do{ 
    Write-Output "Count: $i"
    $i--
}while($i -ge 0)



#Example3 For Loop
for($i=0; $i -le 10; $i++){
    "Counter : $i"
}





#Example 4
$arr = @("Student1","Student2","Student3","Stud4")
            #0             1       2      3
#$arr[2]

for ($i=0; $i -le $arr.Count; $i++ ){
    Write-Output   $arr[$i]
}

#Can you print the array in reverse order like this
#Stud4
#Student3
#Student2
#Student1






#Example 4 : ForEach Loop
$student_names = @("Student1", "Student2", "Student3");
foreach($name in $student_names){
    
    echo "hello! My name is  $name"

} 







#Iterations on HashTable

$student_data = @{
    		"Person1"= "Details of Person1";
            "Person2"= "Details of Person1";
           }


$student_data['Person1']
$student_data.keys

foreach($key in $student_data.keys)
{
    $message = "student_data:   $key   : " + $student_data[$key]
    Write-Output $message
}
