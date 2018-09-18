FROM microsoft/aspnet:4.7.2-windowsservercore-1709 AS base
WORKDIR /inetpub/wwwroot

RUN ["powershell", "-Command", "\"Import-Module WebAdministration; New-WebBinding -Name 'Default Web Site' -IPAddress '*' -Port 20002\""] 
EXPOSE 20002

FROM base AS final
COPY obj/SFApp/publish .
