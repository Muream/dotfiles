# Symlink all the different configurations

## Windows Terminal
New-Item -Force -ItemType Junction -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -Value (Get-Item ".\WindowsTerminal").FullName

## Starship
New-Item -Force -ItemType HardLink -Path $HOME\.config\starship.toml -Value (Get-Item ".\starship\starship.toml").FullName
 
## Powershell profile
New-Item -Force -ItemType HardLink -Path $PROFILE -Value (Get-Item ".\Powershell\Microsoft.PowerShell_profile.ps1").FullName

## Neovim
New-Item -Force -ItemType Junction -Path $HOME\AppData\Local\nvim -Value (Get-Item ".\nvim").FullName

## LazyGit
New-Item -Force -ItemType HardLink -Path "$env:APPDATA\lazygit\config.yml"  -Value (Get-Item ".\lazygit\config.yml").FullName

