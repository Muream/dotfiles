$documents = [System.Environment]::GetFolderPath("MyDocuments")
New-Item -ItemType SymbolicLink -Path $PROFILE -Value (Get-Item ".\Powershell\Microsoft.PowerShell_profile.ps1").FullName
