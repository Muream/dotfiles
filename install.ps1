# Symlink all the different configurations

## Windows Terminal
New-Item -Force -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Value (Get-Item ".\WindowsTerminal\settings.json").FullName
New-Item -Force -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json" -Value (Get-Item ".\WindowsTerminal\settings.json").FullName

## Starship
New-Item -Force -ItemType SymbolicLink -Path $HOME\.config\starship.toml -Value (Get-Item ".\starship\starship.toml").FullName

## Powershell profile
New-Item -Force -ItemType SymbolicLink -Path $PROFILE -Value (Get-Item ".\Powershell\Microsoft.PowerShell_profile.ps1").FullName

## Neovim
New-Item -Force -ItemType SymbolicLink -Path $HOME\AppData\Local\nvim -Value (Get-Item ".\nvim").FullName

## LazyGit
New-Item -Force -ItemType SymbolicLink -Path "$env:APPDATA\lazygit\config.yml"  -Value (Get-Item ".\lazygit\config.yml").FullName

