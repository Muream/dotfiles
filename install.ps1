$documents = [System.Environment]::GetFolderPath("MyDocuments")
New-Item -Force -ItemType SymbolicLink -Path $PROFILE -Value (Get-Item ".\Powershell\Microsoft.PowerShell_profile.ps1").FullName
New-Item -Force -ItemType SymbolicLink -Path $HOME\AppData\Local\nvim -Value (Get-Item ".\nvim").FullName
New-Item -Force -ItemType SymbolicLink -Path $HOME\.config\starship.toml -Value (Get-Item ".\starship\starship.toml").FullName

