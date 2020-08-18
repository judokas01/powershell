<#
	The sample scripts are not supported under any Microsoft standard support 
	program or service. The sample scripts are provided AS IS without warranty  
	of any kind. Microsoft further disclaims all implied warranties including,  
	without limitation, any implied warranties of merchantability or of fitness for 
	a particular purpose. The entire risk arising out of the use or performance of  
	the sample scripts and documentation remains with you. In no event shall 
	Microsoft, its authors, or anyone Else involved in the creation, production, or 
	delivery of the scripts be liable for any damages whatsoever (including, 
	without limitation, damages for loss of business profits, business interruption, 
	loss of business information, or other pecuniary loss) arising out of the use 
	of or inability to use the sample scripts or documentation, even If Microsoft 
	has been advised of the possibility of such damages 
#>

$ErrorActionPreference = 'Stop'

# Specify backup folder
$BackupFolderPath = "D:\backupfolder" # change according to your requirement

Function Export-Emails
{
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory=$true)]$Folder,
		[Parameter(Mandatory=$true)][String]$ExportPath
	)

	If (-Not (Test-Path -Path $ExportPath)) {
		New-Item -Path $ExportPath -ItemType Directory | Out-Null
	}

	$MailCount = 0
	$Folder.Items | ForEach-Object {
		$_.SaveAs("$ExportPath\$($_.Subject).msg", [Microsoft.Office.Interop.Outlook.OlSaveAsType]::olMSGUnicode)
		$MailCount++
	}

	$Folder.Folders | ForEach-Object {
		$exportCount = Export-Emails -Folder $_ -ExportPath "$ExportPath\$($_.Name)"
		$MailCount += $exportCount
	}

	Return $MailCount
}

Try {
	# get application
	$outlookApp = New-Object -ComObject Outlook.Application
	$MAPINS = $outlookApp.GetNameSpace("MAPI")

	# get inbox
	$inbox = $MAPINS.GetDefaultFolder([Microsoft.Office.Interop.Outlook.olDefaultFolders]::olFolderInBox) 

	# iterate to export all emails
	$MailCount = Export-Emails -Folder $inbox -ExportPath $BackupFolderPath

	Write-Host "$MailCount mails are exported to folder '$BackupFolderPath' successfully!"

} Catch {
	Throw $_
}
