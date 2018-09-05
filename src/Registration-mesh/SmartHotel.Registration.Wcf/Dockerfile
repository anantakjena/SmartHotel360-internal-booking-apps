FROM microsoft/aspnet:4.7.2-20180814-windowsservercore-1709
WORKDIR WcfService
RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "WcfService" -PhysicalPath C:\WcfService -BindingInformation "*:88:"
EXPOSE 88
COPY bin/Release/Publish .