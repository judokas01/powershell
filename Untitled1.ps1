foreach ($pc in list_awal.txt){
Enter-PSSession $pc
 Set-ExecutionPolicy Unrestricted
 Enable-WSManCredSSP -Role Client -DelegateComputer *.awal -force

 Disable-WSManCredSSP -Role Client -DelegateComputer *.awal -force
  Copy-Item -Path D:\Transport\Hotline\test.txt.txt -Destination \\PC50\c$\hotline\test.txt;
 Set-ExecutionPolicy Restricted
 -verb RunAs

 }