
Get-Content "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\TestFile.csv"



#Example1  Reading CSV File
$csv_content = Import-Csv "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section3\TestFile.csv"
$csv_content


$csv_content | Get-Member




#Note: We can use commands like below. We will discuss them in detail when we will be introduced with Objects & Pipeline
$csv_content | Sort-Object Marks 


$csv_content | Select-Object -First 2

$csv_content | Where-Object {$_.StudentName -like "R*"}



$csv_content.GetType()


#Example2 Creating csv file & adding content
#Below command will create the file if do not exist else it will add the content 
#to existing file
Add-Content -Path Students_data.csv  -Value '"Name","Class","Percentage"'

#Array
$student_data = @(
  '"Student 0","Science","95%"'
  '"Student 1","Maths","98%"'
  '"Student2","Geography","60%"'
  )

#Adding content to CSV
$student_data | foreach { Add-Content -Path  Students_data.csv -Value $_ }






#Practical usage of what we learnt.
#Convert Unsorted data file into Sorted Data file

Import-Csv unsorted.csv | Sort-Object Marks |   Export-Csv Sorted.csv -NoTypeInformation

#NoTypeInformation parameter omits  unwanted line of output in the starting, so it is good to include it