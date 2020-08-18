#Example1  Reading XML File
[xml]$xml_content = Get-Content "comp_info_sample.xml"
$xml_content


$xml_content.gettype()
$xml_content | Get-Member


$xml_content






#Reading XML
$xml_content.MAIN_NODE


$xml_content.MAIN_NODE.COMP

$xml_content.MAIN_NODE.ADDITIONAL_INFO


$xml_content.MAIN_NODE.FirstChild







$xml_content.GetElementsByTagName("COMP")




foreach ($entity in $xml_content.GetElementsByTagName("COMP") ){ 
    Write-Output $entity.IP
    $ower_team = $entity.OWNED_BY_TEAM
    Write-Output $ower_team
}





#Practical usage of what we have learnt.

#1 Prepare application's configuration file and read it to feed values inside script

#2 Save the object state into a file. This file can be later loaded into the PowerShell and again access 
#the same object as if we are accessing a live process(in this case). This can be used for debugging a system problem


Get-Process | Select-Object -First 2 | Export-Clixml output.xml



<#
{
    "COMP_INFO": {
        "NAME": "machine_name",
		"machine_name": {
            "SERVICES_INSTALLED": "BITS,AAA,BBB",
			"CPU_THREASHOLD_PERCENT": 80
            }
        }
 }
 #>

#JSON File Handling
#How To read a JSON file
$json_object = Get-Content .\sample_json.json | Out-String | ConvertFrom-Json

$json_object | Get-Member

$json_object.COMP_INFO

$services = $json_object.COMP_INFO.machine_name.SERVICES_INSTALLED
$services 

Get-Help ConvertFrom-Json -ShowWindow

