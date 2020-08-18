#Version 1
#Web scrapping basics
$webrequest = Invoke-WebRequest -Uri 'http://techsckool.com/'

#Know your object
$webrequest | Get-Member

# Getting the status code
# 200 means no Http request error
$status_code = $webrequest.StatusCode
$status_code = $webrequest.StatusDescription

Write-Verbose "Status code returned : $status_code"

#Some more web scrapping

#Get all links embeded in web page
	$webrequest.Links
	$webrequest.Links | select href

#reading the content
	$webrequest.RawContent


#Reading table content from a web page
	$webrequest = Invoke-WebRequest -Uri 'https://www.w3schools.com/html/html_tables.asp'
	$WebRequest.ParsedHtml.getElementsByTagName("TABLE")[0].outerHTML


#Accessing Form fields
    $webrequest = Invoke-WebRequest -Uri 'https://www.w3schools.com/html/html_forms.asp'
    $WebRequest.Forms.fields



#Reading an important information from remote page
    $HTML = Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/PowerShell'
	$app_version=$HTML.ParsedHtml.body.outerHTML
	$tables = @($HTML.ParsedHtml.getElementsByTagName("TABLE"))
	$table = $tables[0]
    $table.rows[7].cells[1].innerText

	
	
	
#Download a file
	$url = "https://upload.wikimedia.org/wikipedia/commons/3/3a/Aishwarya_Rai_Cannes_2017.jpg"

	#Method1
		$web_client = New-Object System.Net.WebClient
		$web_client.DownloadFile($url, "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section5\test\img_name1.jpg")

	#Method2
		Invoke-WebRequest $url -OutFile "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section5\test\img_name2.jpg"



#Download all images from a website
	$URL = "https://powershell.org/"
	$Site = Invoke-WebRequest -Uri $URL

	$Images = ($Site).Images.src

	$wc = New-Object System.Net.WebClient

	foreach ($Image in $Images) {
		$img_arr = ($Image.ToString() -split "/")
		$img_name_pos = $img_arr.length-1

		$img_name= $img_arr[$img_name_pos].trim()

		$wc.DownloadFile($Image, "C:\PowerShell\Advanced_PowerShell\Practice Lab\Section5\test\$img_name")
	}

	
	


#Download all images from a website
$my_discussions_website = Invoke-WebRequest –Uri https://techsckool.com/courses/ –UseBasicParsing

@($my_discussions_website.Images.src).foreach({

    $fileName = $_ | Split-Path -Leaf
    Write-Host "Downloading image file $fileName"
    Invoke-WebRequest -Uri $_ -OutFile "C:\AD\$fileName"
    Write-Host 'Image download complete'

})


	
#Another method to explore:
Start-BitsTransfer
