
#LOGIC: 
Write-Host "This statement is my favorite statement"  -ForegroundColor Black -BackgroundColor DarkCyan
Write-Host "This is world's most stupid statement1"  -ForegroundColor Red -BackgroundColor DarkCyan
Write-Host "This statement is my favorite statement"  -ForegroundColor Black -BackgroundColor DarkCyan
Write-Host "This is world's most stupid statement1"  -ForegroundColor Red -BackgroundColor DarkCyan
Write-Host "This is world's most stupid statement2"  -ForegroundColor Red -BackgroundColor DarkCyan
    
    # An Unnecessary For Loop
$sentence = @("Most","stupid", "logic")
    Foreach ($word in $sentence){
        Write-Output $word
    }

# This is some Important Logic######

#




#CREATING IseSnippet

New-IseSnippet -Title Comment-BasedHelp -Description "A template for comment-based help." -Text @'
Write-Host "This statement is my favorite statement"  -ForegroundColor Black -BackgroundColor DarkCyan
Write-Host "This is world's most stupid statement1"  -ForegroundColor Red -BackgroundColor DarkCyan
Write-Host "This is world's most stupid statement2"  -ForegroundColor Red -BackgroundColor DarkCyan
    
    # An Unnecessary For Loop
    Foreach ($word in $sentence){
        Write-Output $word
    }

# This is some Important Logic######

'@



Get-IseSnippet

Location :  C:\Users\{Your user name}\Documents\WindowsPowerShell\Snippets