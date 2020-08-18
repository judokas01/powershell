#Example1 Create Simple Class in PowerShell

class Student{
[String]$name='NA'
[int32]$age='0'

}

$student_obj = New-Object Student
$student_obj
$student_obj.GetType()

$student_obj | gm

$student_obj.age

$student_obj.age=100
$student_obj.name='Vijay Saini'
$student_obj





#Example2 Create Simple Class in PowerShell
class MathClass{
[int32]$number1 = 0
[int32]$number2 = 0


#Method
[int32] Addition(){
    
    return $this.number1 + $this.number2;
}


#Method
[int32] Subtraction(){
    
    return $this.number2 - $this.number1;
}


#Method
[String] toString(){
    
    return "Hello This is a class which can be used to perform math Operatons on"+ $this.number1 + " and " + $this.number1;
}

}


$mathclass_obj = New-Object MathClass



$mathclass_obj | Get-Member

$mathclass_obj.number1 = 100
$mathclass_obj.number2 = 200
$mathclass_obj.Subtraction()

$mathclass_obj.Subtraction()

$mathclass_obj.toString();