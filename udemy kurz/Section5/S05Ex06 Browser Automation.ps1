

#--------UI Related Functions
Function WaitForPage([int] $delayTime = 10)
{
  $loaded = $false
  
  while ($loaded -eq $false) {
    [System.Threading.Thread]::Sleep($delayTime) 
    
    #If the browser is not busy, the page is loaded
    if (-not $global:ie.Busy)
    {
      $loaded = $true
    }
  }
  
  $global:doc = $global:ie.Document
  
}


Function NavigateTo([string] $url, [int] $delayTime = 100)
{
  $global:ie.Navigate($url)
  
  WaitForPage $delayTime
}

Function SetElementValueByName($name, $value, [int] $position = 0) {
  if ($global:doc -eq $null) {
    write-output "#ERROR5a# : Document is null" | out-file $LOG_FILE -Append -Force;
	
  }
  $elements = @($global:doc.getElementsByName($name))
  if ($elements.Count -ne 0) {
    $elements[$position].Value = $value
  }
  else {
    write-output "#ERROR5b# : Couldn't find any element with name ""$name""" | out-file $LOG_FILE -Append -Force;
  }
}


Function ClickElementByTagName($tagName, [int] $position = 0)
{
  if ($global:doc -eq $null) {
    write-output "#ERROR5c# : Document is null" | out-file $LOG_FILE -Append -Force;
   }
  $elements = @($global:doc.getElementsByTagName($tagName))
  if ($elements.Count -ne 0) {
    $elements[$position].Click()
    WaitForPage
  }
  else {
    write-output "#ERROR5d# : Couldn't find element ""$tagName"" at position ""$position""" | out-file $LOG_FILE -Append -Force;
  }
}

Function ClickElementById($id)
{
  $element = $global:doc.getElementById($id)
  if ($element -ne $null) {
    $element.Click()
    WaitForPage
  }
  else {
    write-output "#ERROR5e# :Couldn't find element with id ""$id""" | out-file $LOG_FILE -Append -Force;
  
  }
}

Function ClickElementByName($name, [int] $position = 0)
{
  if ($global:doc -eq $null) {
     write-output "#ERROR5f# :Document is null" | out-file $LOG_FILE -Append -Force;
  
    
  }
  $elements = @($global:doc.getElementsByName($name))
  if ($elements.Count -ne 0) {
    $elements[$position].Click()
    WaitForPage
  }
  else {
     write-output "#ERROR5f# : Couldn't find element with name ""$name"" at position ""$position""" | out-file $LOG_FILE -Append -Force;
  
  }
}


$URI='http://localhost:8085/vijay_website/A_Simple_form.php'
$global:ie = New-Object -com "InternetExplorer.Application"
$global:ie.Navigate("about:blank")
$global:ie.visible = $true


$user_name="Vijay"
Try{
	NavigateTo $URI
SetElementValueByName "userName" $user_name
	SetElementValueByName "lastname" "Saini"
	ClickElementByName "submit_button"
	
} Catch {
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
	write-output "#ERROR5-# ErrorMessage : $ErrorMessage" | out-file $LOG_FILE -Append -Force;
	write-output "#ERROR5-# FailedItem : $FailedItem" | out-file $LOG_FILE -Append -Force;
}
	
$global:ie.quit() 


NavigateTo "http://www.google.com/advanced_search"
SetElementValueByName "as_oq" "Unisys Fenix PLDA"
SetElementValueByName "num" "30"
SetElementValueByName "lr" "lang_en"
ClickElementByName "btnG"