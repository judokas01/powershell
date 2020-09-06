Get-MsolDomain | ForEach-Object {if($_.Name -match "onmicrosoft.com"){$name = $_.Name}}
 $tenant_name = $name.Substring(0, $name.IndexOf('.'))

#konec získání názvu tenanta -> nmázev licence je teda $tenant_name":STANDARDWOFFPACK_FACULTY" - licence zaměstatnec

 Get-MsolUser | where {$_.isLicensed -eq $true} | Select-Object Displayname, UserPrincipalName ,Licenses -Last 1 | ForEach-Object {
$school_mail = $_.UserPrincipalName
}
$school_mail =$school_mail.Split('@')[-1]



#tohle už je ve skriptu ^^^^^^^^^^^^^




$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop')
Filter = 'csv (*.csv)|*.csv'
    Title = 'Zvolte CSV s uživateli' }
$null = $FileBrowser.ShowDialog()

$user_file = $FileBrowser.FileName
$log_file = $user_file.Substring(0, $user_file.IndexOf('.'))
$user_log_file = $log_file,'_log','.csv' -join ''
echo "Jmeno;Prijmeni;Email;Heslo;Pozice;Trida;Telefon;Stav" | Export-Csv $user_log_file -NoTypeInformation
echo "Jmeno;Prijmeni;Email;Heslo;Pozice;Trida;Telefon;Stav" | out-file $user_log_file -Append default
import-csv -Path $user_file -Delimiter ';' -Encoding Default | ForEach-Object{
$log_line = ""
$check = 'ok'
$operation = $_.Stav


$firstname = $_.Jmeno
if($firstname -eq "")
    {
    $log_line = '!! není zadáno !!'
    }
    else{
    $log_line = $firstname
    }


$lastname = $_.Prijmeni
if($lastname -eq "")
    {
    $log_line = $log_line,'!! není zadáno !!'  -join ';'
    }
    else{
    $log_line = $log_line,$lastname  -join ';'
    }


$displayname = $firstname,$lastname  -join ' '



$email = $_.Email
#ochrana pokud by tam někdo dal svůj mail z jiné domény
if ($operation -match 'new')
    {
    $user = Get-MsolUser -SearchString $email
    if ($user)
        {
        $check = 'no'
        $log_line = $log_line,'!! už existuje !!'  -join ';'
        }
        else{
        $log_line = $log_line,$email  -join ';'
        }
    }

elseif($email -eq "")
    {
    $log_line = $log_line,'!! není zadáno !!'  -join ';'
    $check = 'no'
    }
 else{
    $log_line = $log_line,$email  -join ';'
    }
$email = $email,"@",$school_mail -join ''



$password = $_.Heslo
if($password -eq "" -and $operation -match 'new')
    {
    $password = 'Start',$firstname.SubString(0,2),$lastname.SubString(0,2),'2@2@' -join ''
    $passwordchange = 1
    $log_line = $log_line,$password  -join ';'
    }
    elseif($operation -match 'new'){
    $log_line = $log_line,$password  -join ';'
    }
    else{
    $log_line = $log_line,'nezměněno'  -join ';'
    }


$licence_pozice = $_.Pozice


if($licence_pozice -eq "zamestnanec" -or $licence_pozice -eq 'zaměstnanec')
    {
    $role = 'Owner'
    $add_team = $true
    $licence = $tenant_name,"STANDARDWOFFPACK_FACULTY" -join ':'
     $log_line = $log_line,$licence  -join ';'
    }

elseif($licence_pozice -eq "student" -or $licence_pozice -eq "žák" -or $licence_pozice -eq "zak")
    {
    $role = 'Member'
    $add_team = $true
    $licence = $tenant_name,"STANDARDWOFFPACK_STUDENT" -join ':'
    $log_line = $log_line,$licence  -join ';'
    }
    else{
    $check = $false
    $log_line = $log_line,'!! není zadáno !!'  -join ';'
    }





$trida = $_.Trida
if($trida -eq "")
    {
    $log_line = $log_line,'N/A'  -join ';'
    }
    else{
    $log_line = $log_line,$trida  -join ';'
    }


#telefon - nebudu kontrolovat validitu
$telefon = $_.Telefon
if($telefon -eq "")
    {
    $log_line = $log_line,'!! není zadáno !!'  -join ';'
    }
    else{
    $log_line = $log_line,$telefon  -join ';'
    }



$allinfo = $firstname,$lastname,$email,$password,$licence_zamestnanec,$licence_student,$telefon,$trida -join ' '



#echo $allinfo



if ($operation -match 'new' -and $check -match 'ok')
    {

    #New-MsolUser -UserPrincipalName $email -FirstName $firstname -LastName $lastname -LicenseAssignment $licence -DisplayName $displayname -UsageLocation "CZ" -Password $password -ForceChangePassword $passwordchange -PhoneNumber $telefon
    echo 'New-MsolUser -UserPrincipalName '$email' -FirstName '$firstname' -LastName '$lastname' -LicenseAssignment '$licence' -DisplayName '$displayname' -UsageLocation "CZ" -Password '$password' -ForceChangePassword '$passwordchange' -PhoneNumber '$telefon''
    $state = 'Uživatel vytvořen'
    }
        elseif($check -notmatch 'ok'){
    $state = "!!! Uživatel nevytvořen !!!"
    #
    }
    else{
    $state = $operation
    #
    }




$log_line = $log_line,$state -join ';'
echo $log_line | out-file $user_log_file -Append default



 

<#
New-Team -DisplayName $class_name $popisek -Template EDU_Class $owner
echo $user
echo $user_dep
#>
}

$user_log_file_temp = $user_file.Substring(0, $user_file.IndexOf('.'))
$user_log_file_temp = $user_log_file_temp,'_temp','.csv' -join ''

get-content $user_log_file |
    select -Skip 2 |
    set-content $user_log_file_temp
move $user_log_file_temp $user_log_file -Force


Start-Sleep -s 2

$user_log_file_enrol = $user_file.Substring(0, $user_file.IndexOf('.'))
$user_log_file_enrol = $log_file,'_zapisy','.csv' -join ''
echo "Jmeno;Prijmeni;Email;Trida;Stav" | Export-Csv $user_log_file_enrol -NoTypeInformation
echo "Jmeno;Prijmeni;Email;Trida;Stav" | out-file $user_log_file_enrol -Append default


import-csv -Path $user_log_file -Delimiter ';' -Encoding Default | ForEach-Object{


$firstname = $_.Jmeno
$lastname = $_.Prijmeni
$trida = $_.Trida
$email = $_.Email
$licence_pozice = $_.Pozice
$stav = $_.Stav
echo $trida $email $licence_pozice $stav

$log_line = $firstname,$lastname,$email,$trida -join ';'


if($stav -match '!')
    {
    #nezapisuj !!
    echo "nezapisuj"$email
    $log_line = $log_line,"!!!PROBLÉM Z IMPORTU TVORBY ŽÁKŮ!!!" -join ';'
    }
else
{

    if($licence_pozice -eq "zamestnanec" -or $licence_pozice -eq 'zaměstnanec')
        {$
        $role = 'Owner'
        }
        else{
        $role = 'Member'
        }

            Get-Team | ForEach-Object{

                if($_.DisplayName -match $trida){
                $log_line = $log_line,$_.DisplayName -join ';'
                #Add-TeamUser -GroupId $_.GroupId -User $email -Role $role 
                echo 'Add-TeamUser -GroupId '$_.GroupId' -User '$email' -Role '$role''
                }
                else{
                #not signed
                }
        }


    }


echo $log_line | out-file $user_log_file_enrol -Append default
}




$user_log_file_enrol_temp = $user_log_file_enrol.Substring(0, $user_log_file_enrol.IndexOf('.'))
$user_log_file_enrol_temp = $user_log_file_enrol_temp,'_temp','.csv' -join ''

get-content $user_log_file_enrol |
    select -Skip 2 |
    set-content $user_log_file_enrol_temp
move $user_log_file_enrol_temp $user_log_file_enrol -Force



