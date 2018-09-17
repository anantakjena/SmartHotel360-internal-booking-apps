# Build SmartHotel360 Internal Booking apps for Service Fabric Mesh

This folder contains a Visual Studio solution (./SmartHotel.Registration.sln) which contains two ASP.NET services: SmartHotel.Registration (WebForms) and SmartHotel.Registration.Wcf (WCF)

The projects in the solution can be deployed to Mesh, by using the `Visual Studio` -> `Add Container Orhcestration` feature.

## Docker compose files for Mesh deployment

To work around an issue with container time being off, which will prevent Application Insight to accept data from the containers, use the following docker files:

### WCF-Service

``` dockerfile
FROM microsoft/aspnet:4.7.2-20180814-windowsservercore-1709

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install Windows components required for WCF service hosted on IIS
RUN Add-WindowsFeature NET-WCF-TCP-Activation45; \
Add-WindowsFeature NET-WCF-HTTP-Activation45; \
Add-WindowsFeature Web-WebSockets

WORKDIR WcfService
RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "WcfService" -PhysicalPath C:\WcfService -BindingInformation "*:88:"
EXPOSE 88
COPY bin/Release/Publish .
```

### Web-Service

``` dockerfile
FROM microsoft/aspnet:4.7.2-20180814-windowsservercore-1709
WORKDIR /inetpub/wwwroot
COPY bin/Release/Publish .
```