using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Import-Module posh-git          # Provides git completions and more
Import-Module PSReadLine        # shell interactions
Import-Module Terminal-Icons    # Add Icons to files and folders

# -- PSReadLine ------------------------------------------------------------------------
# --- Options --------------------------------------------------------------------------

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -BellStyle Visual
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# --- Keybinds -------------------------------------------------------------------------
#
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# -- Starship Prompt -------------------------------------------------------------------

function Invoke-Starship-PreCommand {
    # Send an escape sequence to let the terminal know what the current directory is.
    $loc = $($executionContext.SessionState.Path.CurrentLocation);
    $host.ui.Write("$([char]27)]9;9;`"$loc`"$([char]27)\")
}
Invoke-Expression (&starship init powershell)

# -- Completions -----------------------------------------------------------------------
# --- Winget Completions ---------------------------------------------------------------
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# --- Starship Completions -------------------------------------------------------------

Register-ArgumentCompleter -Native -CommandName 'starship' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'starship'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'starship' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Print version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version information')
            [CompletionResult]::new('bug-report', 'bug-report', [CompletionResultType]::ParameterValue, 'Create a pre-populated GitHub issue with information about your configuration')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate starship shell completions for your shell to stdout')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'Edit the starship configuration')
            [CompletionResult]::new('explain', 'explain', [CompletionResultType]::ParameterValue, 'Explains the currently showing modules')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Prints the shell function used to execute starship')
            [CompletionResult]::new('module', 'module', [CompletionResultType]::ParameterValue, 'Prints a specific prompt module')
            [CompletionResult]::new('print-config', 'print-config', [CompletionResultType]::ParameterValue, 'Prints the computed starship configuration')
            [CompletionResult]::new('prompt', 'prompt', [CompletionResultType]::ParameterValue, 'Prints the full starship prompt')
            [CompletionResult]::new('session', 'session', [CompletionResultType]::ParameterValue, 'Generate random session key')
            [CompletionResult]::new('time', 'time', [CompletionResultType]::ParameterValue, 'Prints time in milliseconds')
            [CompletionResult]::new('timings', 'timings', [CompletionResultType]::ParameterValue, 'Prints timings of all active modules')
            [CompletionResult]::new('toggle', 'toggle', [CompletionResultType]::ParameterValue, 'Toggle a given starship module')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'starship;bug-report' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;completions' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;config' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;explain' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--pipestatus', 'pipestatus', [CompletionResultType]::ParameterName, 'Bash, Fish and Zsh support returning codes for each process in a pipeline')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('--terminal-width', 'terminal-width', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('--logical-path', 'logical-path', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('--cmd-duration', 'cmd-duration', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('--keymap', 'keymap', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;init' {
            [CompletionResult]::new('--print-full-init', 'print-full-init', [CompletionResultType]::ParameterName, 'print-full-init')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;module' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--pipestatus', 'pipestatus', [CompletionResultType]::ParameterName, 'Bash, Fish and Zsh support returning codes for each process in a pipeline')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('--terminal-width', 'terminal-width', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('--logical-path', 'logical-path', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('--cmd-duration', 'cmd-duration', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('--keymap', 'keymap', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('-l', 'l', [CompletionResultType]::ParameterName, 'List out all supported modules')
            [CompletionResult]::new('--list', 'list', [CompletionResultType]::ParameterName, 'List out all supported modules')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;print-config' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Print the default instead of the computed config')
            [CompletionResult]::new('--default', 'default', [CompletionResultType]::ParameterName, 'Print the default instead of the computed config')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;prompt' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--pipestatus', 'pipestatus', [CompletionResultType]::ParameterName, 'Bash, Fish and Zsh support returning codes for each process in a pipeline')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('--terminal-width', 'terminal-width', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('--logical-path', 'logical-path', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('--cmd-duration', 'cmd-duration', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('--keymap', 'keymap', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--right', 'right', [CompletionResultType]::ParameterName, 'Print the right prompt (instead of the standard left prompt)')
            [CompletionResult]::new('--continuation', 'continuation', [CompletionResultType]::ParameterName, 'Print the continuation prompt (instead of the standard left prompt)')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;session' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;time' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;timings' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--pipestatus', 'pipestatus', [CompletionResultType]::ParameterName, 'Bash, Fish and Zsh support returning codes for each process in a pipeline')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('--terminal-width', 'terminal-width', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('--logical-path', 'logical-path', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('--cmd-duration', 'cmd-duration', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('--keymap', 'keymap', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;toggle' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}

