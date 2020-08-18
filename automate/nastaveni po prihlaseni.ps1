$UserCredential = Get-Credential
Connect-MsolService -Credential $UserCredential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking


DO {
echo "Zadejte jméno a příjmení"
$firstname = Read-Host -Prompt 'jméno?'
$lastname = Read-Host -Prompt 'příjmení'

$potvrzeni = (Get-MsolUser -SearchString $lastname | Select-Object Lastname)
$potvrzeni = $potvrzeni.LastName

}Until ($potvrzeni -eq $lastname)


Function Replace-Diacritics {
Param ([ref]$text)
$ds = ("á","a"),("ě","e"),("é","e"),("í","i"),("ó","o"),("ú","u"),("ů","u"),("č","c"),("ý","y"),("š","s"),("ř","r"),("ž","z"),("ť","t"),("ď","d"),("ň","n"),("Á","A"),("Ě","E"),("É","E"),("Í","I"),("Ó","O"),("Ú","U"),("Ů","U"),("Č","C"),("Ý","Y"),("Š","S"),("Ř","R"),("Ž","Z"),("Ť","T"),("Ď","D"),("Ň","N")

foreach ($d in $ds) {
$text.value = $text.value -creplace($d[0],$d[1])
}
}

$text = $firstname
Replace-Diacritics ([ref]$text)
$firstname = echo $text
$text = $lastname
Replace-Diacritics ([ref]$text)
$lastname = echo $text

$username = echo $firstname"."$lastname
echo $username
$ffirstname = $firstname.SubString(0,1)
$hostname = echo $lastname"-"$ffirstname
echo $hostname
echo $username
net user $username 1stclass /add
net localgroup administrators $username /add
Rename-Computer -NewName $hostname

$department = (Get-MsolUser -SearchString $lastname | Select-Object Department)
$department = $department.Department


#after login


#import asi přes HTML, který tenhle script poskládá a naimportuje

New-Item -ItemType "directory" c:\support
echo "co je potřeba ještě dodělat
- výchozí motiv uživatele
- vypnout teams po startu

" > c:\support\to-do-list.txt
& c:\support\to-do-list.txt