
function Get-URLStatus
{
    [CmdletBinding()]
    
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$false,
                   ValueFromPipelineByPropertyName=$true,
                   ValueFromPipeline=$true,
                   Position=0)]
        $URI,

        [switch] $errorlog,
        [String] $logfile = "C:\PowerShell\webscrapping_logfile.log"
    )

     
     Begin{

            if($errorlog){  Write-Output "Checking the URL status" | Out-File $logfile -Append  }
        }


    Process{

            Try{

                 $webrequest = Invoke-WebRequest -Uri $URI
                        
                # Getting the status code
                # 200 means no Http request error
                $status_code = $webrequest.StatusCode

                if ( $status_code -eq 200){
                     if ($errorlog){ Write-Output "$URI  ::  $status_code   :: GOOD" | out-file $logfile -Append -Force;}
	            
                     Write-Host "$URI  ::  $status_code   :: GOOD" -BackgroundColor Green -ForegroundColor  DarkBlue
               
                } else {
                    if ($errorlog){  Write-Output "$URI  ::  $status_code   :: GOOD" | out-file $logfile -Append -Force;}

                    Write-Host "$URI  ::  $status_code   :: BAD" -BackgroundColor red -ForegroundColor Yellow
                }
               

                } catch{
            
                $ErrorMessage = $_.Exception.Message
                $FailedItem = $_.Exception.ItemName
	
	            if ($errorlog){ 
                    Write-Output "Something went wrong while checking status of URL : $URI" | out-file $logfile -Append -Force;
	                Write-Output "#ERROR1a# ErrorMessage : $ErrorMessage" | out-file $logfile -Append -Force;
	                Write-Output "#ERROR1a# FailedItem : $FailedItem" | out-file $logfile -Append -Force;
                  }

             }
        }
       
    
    End{
         if ($errorlog){   Write-Output "Done with invoking web request for all URLs" | Out-File $logfile -Append  }
      
      }

}




#calling the advanced function

Get-URLStatus -URI "http://www.techsckool.com/"  

Get-URLStatus -URI "http://www.techsckool.com/" -errorlog 

Get-URLStatus -URI "http://www.techsckool.com/"  -errorlog -logfile "new_name.log"


# passing variable via a pipeline
$arr_URIs = @("https://www.facebook.com/", "https://www.google.co.in", "http://mail.google.com");

$arr_URIs | Get-URLStatus -Verbose -errorlog


