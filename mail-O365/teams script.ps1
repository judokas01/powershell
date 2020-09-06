<#
setup
Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "1.1.3-preview"
-tenhle modul musí být tahle specifikcá verze, jinak tam nefungjují všechny příkazy

install-Module msonline


#>
#připojení jak do správy teamsů, tak O365
$UserCredential = Get-Credential
Connect-MsolService -Credential $UserCredential
Connect-MicrosoftTeams -Credential $UserCredential
#připojení jak do správy teamsů, tak O365


#získání tenant name -> kvůli názvu licencí

Get-MsolDomain | ForEach-Object {if($_.Name -match "onmicrosoft.com"){$name = $_.Name}}
 $tenant_name = $name.Substring(0, $name.IndexOf('.'))

 <#konec získání názvu tenanta -> nmázev licence je teda $tenant_name":STANDARDWOFFPACK_FACULTY" - licence zaměstatnec
  $tenant_name":STANDARDWOFFPACK_FACULTY" - licence zaměstatnec
   $tenant_name":STANDARDWOFFPACK_STUDENT" - licence student#>


#získání mailové adresy pro všechny - už se zavináčem
Get-MsolUser | where {$_.isLicensed -eq $true} | Select-Object Displayname, UserPrincipalName ,Licenses -Last 1 | ForEach-Object {
$mail = $_.UserPrincipalName
}
$mail =$mail.Split('@')[-1]
$mail = "@",$mail -join ''

#takhle to projoinuju aby to bylo na jednom radku $mail_adress = $user_mail,$mail -join ''





#vzor připojení žáka do teamu
#   Add-TeamUser -GroupId 18aa0fda-e629-4f9c-ba39-1bda87925136 -user zak8.1a@sscgcz.onmicrosoft.com -role Member
#konec vzoru


<# vzory
{sscgcz:STANDARDWOFFPACK_FACULTY} - licence zaměstatnec

{sscgcz:STANDARDWOFFPACK_STUDENT} - licence student

New-MsolUser -UserPrincipalName "script@sscgcz.onmicrosoft.com" -FirstName "Script" -LastName "Test" -LicenseAssignment "sscgcz:STANDARDWOFFPACK_FACULTY" -DisplayName "Testovací uživatel vytvořený skriptem" -UsageLocation "CZ" -Password "Start123" -ForceChangePassword 0
  $web = (Get-MsolUser -SearchString "info" | Select-Object Office | foreach-object {echo $_.Office})




  Get-MsolUser -All | where {$_.isLicensed -eq $true} | Select-Object Displayname, UserPrincipalName ,Licenses
#>


# TVORBA TŘÍD (TEAMŮ)

$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop')
Filter = 'csv (*.csv)|*.csv'
    Title = 'Zvolte CSV s třídami' }
$null = $FileBrowser.ShowDialog()

$teams_file = $FileBrowser.FileName
import-csv -Path $teams_file -Delimiter ';' | ForEach-Object{
<#stuff
$user = $_.EmailAddres
$user_dep = $_.role
$user_job = $_.jobtitle
$user_lang = $_.lang


New-Team -DisplayName $class_name $popisek -Template EDU_Class $owner
echo $user
echo $user_dep
#>
}



# Přiřazení žáků do tříd (TEAMŮ)

$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop')
Filter = 'csv (*.csv)|*.csv'
    Title = 'Zvolte CSV s rozdělením žáků do jednotlivých tříd' }
$null = $FileBrowser.ShowDialog()

$pupils_file = $FileBrowser.FileName
import-csv -Path $pupils_file -Delimiter ';' | ForEach-Object{
<#stuff
$user = $_.EmailAddres
$user_dep = $_.role
$user_job = $_.jobtitle
$user_lang = $_.lang

vzor pro vytvoření žáka
New-MsolUser -UserPrincipalName "script@sscgcz.onmicrosoft.com" -FirstName "Script" -LastName "Test" -LicenseAssignment "sscgcz:STANDARDWOFFPACK_FACULTY" -DisplayName "Testovací uživatel vytvořený skriptem" -UsageLocation "CZ" -Password "Start123" -ForceChangePassword 0
  $web = (Get-MsolUser -SearchString "info" | Select-Object Office | foreach-object {echo $_.Office})


Add-TeamUser -GroupID $class_id -User $user -Role $Role (Member/Owner)

#>
}