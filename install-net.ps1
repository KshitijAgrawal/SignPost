$installFolder = "C:\netscripts"
$dotnet_url = "https://download.visualstudio.microsoft.com/download/pr/d37efccc-2ba1-4fc9-a1ef-a8e1e77fb681/b9a20fc29ff05f18d81620ec88ade699/aspnetcore-runtime-7.0.3-win-x64.exe
"

if (Test-Path $installFolder) {
   
    Write-Host "Folder Exists"
    # Perform Delete file from folder operation
}
else
{
  
    #PowerShell Create directory if not exists
    New-Item $installFolder -ItemType Directory
    Write-Host "Folder Created successfully"

}

if (!(Test-Path "$installFolder\aspnetcore-runtime-7.0.3-win-x64.exe")) {
    Write-Host "Downloading .Net 7 setup file"
    Invoke-WebRequest -Uri $dotnet_url -OutFile "$installFolder\aspnetcore-runtime-7.0.3-win-x64.exe"
}

Start-Process -NoNewWindow -FilePath "$installFolder\aspnetcore-runtime-7.0.3-win-x64.exe" -ArgumentList "/install /quiet /norestart" -Wait