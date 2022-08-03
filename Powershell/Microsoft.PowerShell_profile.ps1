if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
} 

function Invoke-Starship-PreCommand {
    # Send an escape sequence to let the terminal know what the current directory is.
    $loc = $($executionContext.SessionState.Path.CurrentLocation);
    $host.ui.Write("$([char]27)]9;9;`"$loc`"$([char]27)\")
}

Invoke-Expression (&starship init powershell)

Import-Module -Name Terminal-Icons

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
# Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle Visual

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward


# Completion for winget
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
