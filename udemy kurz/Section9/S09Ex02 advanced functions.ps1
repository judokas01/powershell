<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Verb-Noun
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $Param1,

        # Param2 help description
        [int]
        $Param2
    )


    Begin
    {
    }
    Process
    {
    }
    End
    {
    }
}


Get-Help Verb-Noun -ShowWindow








function Verb-Noun
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$false,
         ValueFromPipeline=$true)]
        $Param1
    )

    Begin
    {
        "This is Begin block  "
    }	
    Process
    {
        "This is Process block"
    }
    End
    {
         "This is End block "
    }
}



#calling cmdlet:
Verb-Noun

1..10 | Verb-Noun












function Verb-Noun
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$false,
         ValueFromPipeline=$true)]
        $Param1
    )

    Begin
    {
        "This is Begin block  $Param1 "
    }	
    Process
    {
        "This is Process block $Param1"
    }
    End
    {
         "This is End block $Param1"
    }
}



#calling cmdlet:

1..10 | Verb-Noun








<#
.Synopsis
   This is short description to explain Say Hello cmdlet
.DESCRIPTION
  This is long description to explain Say Hello cmdlet
.EXAMPLE
   Example of how to use this Say Hello
   Say-Hello "aa"
.EXAMPLE
   Another example of how to use this Say Hello cmdlet
   Say-Hello "Vijay Saini"
#>
function Say-Hello
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true,HelpMessage="Enter names of size between 5-120 characters")]
        [ValidateLength(5,120)]         
		[string] $Name
    )

    Process
    {
        write-host ("Hello " + $Name + "!")
    }
}

Say-Hello "aa" 

Say-Hello "Vijay Saini"

Get-Help Say-Hello -ShowWindow












#Ex02
<#
.Synopsis
   This is short description to explain Add-All cmdlet
.DESCRIPTION
  This is long description to explain Add-All cmdlet
.EXAMPLE
   Example of how to use this Say Hello
   1..10 | Add-All
.EXAMPLE
   Another example of how to use this Add-All cmdlet
   @(10,10,100)  | Add-All
#>
function Add-All
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$false,
        ValueFromPipeline=$true) ]
        
        [int32]$number
    )

    Begin
    {
        Write-Output "Received the input to add the numbers"
        $total = 0
    }


    Process
    {
         Write-Output "Adding " + $number + " to " + $total
      $total += $number
    }


    End
    {

          Write-Output "Total is : " + $total
    }


}


#Accepting values from pipeline
1..10 | Add-All


#Adding array elments 
@(10,10,100)  | Add-All

Get-Help Add-All  -ShowWindow











#=====================================================================

#Ex03: Passing array to Advanced function
function Add-All
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$false,
        ValueFromPipeline=$true) ]
        
        [int32[]]$numbers
    )

       
      $total = 0
      
      foreach($num in $numbers){
        $total += $num
        echo "Adding $num"
       }
        echo "Total:" $total
     
}


Add-All 10,100,100

#or

Add-All @(20,120,20)
#=====================================================================

