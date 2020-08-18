 Function Delete-Duplicates {
    param(
    [Parameter(
    Mandatory=$True,
    ValueFromPipeline=$True,
    ValueFromPipelineByPropertyName=$True
    )]
    [string[]]$PathDuplicates)

    $DuplicatePaths = 
        Get-ChildItem $PathDuplicates | 
        Get-FileHash |
        Group-Object -Property Hash |
        Where-Object -Property Count -gt 1 |
        ForEach-Object {
            $_.Group.Path |
            Select -First ($_.Count -1)}
    $TotalCount = (Get-ChildItem $PathDuplicates).Count
 Write-Warning ("You are going to delete {0} files out of {1} total. Please confirm the prompt" -f $DuplicatePaths.Count, $TotalCount)    
 $DuplicatePaths | Remove-Item -Confirm

    }
    Delete-Duplicates -PathDuplicates F:\obnova_simon3
