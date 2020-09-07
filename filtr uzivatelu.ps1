#pripojeni
#$UserCredential = Get-Credential
#Connect-MsolService -Credential $UserCredential
#$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
#Import-PSSession $Session -DisableNameChecking

$user_log_file_enrol = C:/gm/export.csv
$user_log_file_enrol = $user_file.Substring(0, $user_file.IndexOf('.'))
$user_log_file_enrol = $log_file,'_zapisy','.csv' -join ''
echo "Jmeno;Prijmeni;Email;Heslo;Pozice;Trida;Telefon;Stav" | Export-Csv $user_log_file_enrol -NoTypeInformation
echo "Jmeno;Prijmeni;Email;Trida;Stav" | out-file $user_log_file_enrol -Append default


#samotny filter
Get-MsolUser -All | where {$_.isLicensed -eq $true} |ForEach-Object {
$jmeno = $_.Firstname
$prijmeni = $_.Lastname
$email =  $_.UserPrincipalName
$heslo = ""
$pozice = $_.Licences
$trida = $_.Department
$telefon = ""
$stav = "OK"

$log_line = $jmeno,$prijmeni,$email,$heslo,$pozice,$trida,$telefon,$stav -join ';'
echo $log_line | out-file $teams_file_log -Append default

}


 | Select-Object DisplayName,FirstName,Lastname,UserPincipalName,Licenses,Department | export-csv c:\GM\export.csv -Delimiter ';' -Encoding Default

 #, DisplayName, UserPrincipalName, Department, Title |  ft -hidetableheaders






 $user_log_file_enrol_temp = $user_log_file_enrol.Substring(0, $user_log_file_enrol.IndexOf('.'))
$user_log_file_enrol_temp = $user_log_file_enrol_temp,'_temp','.csv' -join ''

get-content $user_log_file_enrol |
    select -Skip 2 |
    set-content $user_log_file_enrol_temp
move $user_log_file_enrol_temp $user_log_file_enrol -Force