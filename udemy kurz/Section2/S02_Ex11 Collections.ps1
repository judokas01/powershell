#Example1 : To access array elements
$array = @("student1","student2","student3","student4","student5")

$array

Write-Output "To get the size of an array		: "	$array.Length 
 
Write-Output "To access an item from array by index	:" 	$array[2] 

Write-Output "To access a range of items		:" 	 $array[1..5]  


#Example2 : Add arrays
$array_male = @("Boy1","Boy2","Boy3","Boy4")
$array_female = @("Girl1","Girl2","Girl3")

$array_total = $array_male  + $array_female

$array_total
$array_total.Length


#More Array Operations
$array_total.Contains("Boy3")
$array_total.Contains("Boy100")

$array_total.IndexOf("Girl1")

#Fixed Size?
$array_total.IsFixedSize


$array_total.Add("Please include me")
# Problem???   We cannot add, into fixed sized collection. So we need a better collection


#Array List
$student_list = New-Object System.Collections.ArrayList
$student_list.Add("Male_Student1")
$student_list.AddRange( ("Male_Student2","Female_Student3") )
$student_list


$student_list | Get-Member
  
		   
# HASHTABLE		   

$simple_hash = @{
    		"key1" = "Value of key1";
   		    "key2" = "Value of key2";
    		"key3" = "Value of key3";
           }


$server_data_hash = [ordered]@{
    		"127.0.0.1" = "Remote Machine 1";
   		    "127.0.0.2" = "Remote Machine 2";
    		"127.0.0.3" = "Remote Machine 3"
    		"127.0.0.4" = "Remote Machine 4"
           }
$server_data_hash

#Different methods & properties
$server_data_hash | Get-Member


#To see the number of items
$server_data_hash.count

#Get all keys
$server_data_hash.Keys


#Get all Values
$server_data_hash.Values

#get value by key
$server_data_hash["127.0.0.0"]
#{OR}
$server_data_hash.'127.0.0.0'


#hash table is not fixed size
$server_data_hash.IsFixedSize


#Add a new pair to the hashtable
$server_data_hash.Add("127.0.0.5","remote machine 5")
$server_data_hash

#Duplicates not allowed
$server_data_hash.Add("127.0.0.1","Another Remote machine 1") 


#Remove a key-value pair
$server_data_hash.Remove("127.0.0.1") 
$server_data_hash




#Storing in order
[hashtable]$hash = [ordered]@{ Detail_100 = "Value"; Detail_01 = "Square"; Detail_06 = "Blue"}
$hash

#Practical Usage:
$student_data = @{
    		"Person1"= @{"Detail1"="Hello";"Detail2"="hiii"};
            "Person2"= @{"Detail1"="Hello";"Detail2"="hiii"};
           }

$student_data["Person1"];

#Get Help
Get-Help about_Hash_Tables -ShowWindow
