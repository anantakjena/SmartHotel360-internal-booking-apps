Write-Host "Assumes VS2017 Enterprise for MSBuild.exe path"
$msbuild = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe"

&$msbuild ".\SmartHotel.Registration\SmartHotel.Registration.Web.csproj" /t:Rebuild /p:DeployOnBuild=true /p:PublishProfile=FolderProfile.pubxml
docker build --no-cache .\SmartHotel.Registration -t smarthotelweb:mesh-1709

&$msbuild ".\SmartHotel.Registration.Wcf\SmartHotel.Registration.Wcf.csproj" /t:Rebuild /p:DeployOnBuild=true /p:PublishProfile=FolderProfile.pubxml
docker build --no-cache .\SmartHotel.Registration.Wcf -t smarthotelwcf:mesh-1709