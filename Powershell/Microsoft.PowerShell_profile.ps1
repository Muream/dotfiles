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

