# Build in contaiers: https://blog.alexellis.io/3-steps-to-msbuild-with-docker/
# Load MSBuild as assembly:
# [void][System.Reflection.Assembly]::Load('Microsoft.Build.Utilities.v3.5, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
# $msbuild = [Microsoft.Build.Utilities.ToolLocationHelper]::GetPathToDotNetFrameworkFile("msbuild.exe", "VersionLatest")

Write-Host "Assumes VS2017 Enterprise for MSBuild.exe path"
$msbuild = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe"

&$msbuild ".\SmartHotel.Registration\SmartHotel.Registration.Web.csproj" /t:Rebuild /p:DeployOnBuild=true /p:PublishProfile=FolderProfile.pubxml
docker build --no-cache .\SmartHotel.Registration -t mikkelhegn/smarthotelweb:mesh-1709-KB4343897

&$msbuild ".\SmartHotel.Registration.Wcf\SmartHotel.Registration.Wcf.csproj" /t:Rebuild /p:DeployOnBuild=true /p:PublishProfile=FolderProfile.pubxml
docker build --no-cache .\SmartHotel.Registration.Wcf -t mikkelhegn/smarthotelwcf:mesh-1709-KB4343897