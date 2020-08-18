$var_some_variable = "This is a very important information";
$var_mportant_threashold_percent = 70;


 function func_Addition(){
    param(
	    [int]$number1=0,
	    [int]$number2=0
    )


return ($number1 + $number2)
}





 function func_Subtraction(){
    param(
	    [int]$number1=0,
	    [int]$number2=0
    )


return ($number1 + $number2)
}




 function func_multiplication(){
    param(
	    [int]$number1=0,
	    [int]$number2=0
    )


return ($number1 * $number2)
}





 function func_division(){
    param(
	    [int]$number1=0,
	    [int]$number2=0
    )


return ($number1 / $number2)
}






Export-ModuleMember -Function 'func_*'
Export-ModuleMember -Variable 'var*'