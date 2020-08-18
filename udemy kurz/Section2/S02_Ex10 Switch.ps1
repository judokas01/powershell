Clear-Host
#Example
[int]$num = Read-Host "Enter a number"

switch ($num)
 {
    10 {"You entered $num is equal to 10"; Break}
    100 {"You entered $num is equal to 100"; Break}
    1000 {"You entered $num is equal to 1000"; Break}
    default {"You entered $num is not 10,100 or 1000"}
  }
