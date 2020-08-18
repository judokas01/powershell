cd E:\scripts\XML
dir | ForEach-Object {
$xml = $_.Name
netsh wlan add profile filename="$xml" user=all
}
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install zoiper adobereader googlechrome avastfreeantivirus winrar vlc office365business firefoxchoco -y