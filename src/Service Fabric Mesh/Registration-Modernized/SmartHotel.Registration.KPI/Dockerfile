FROM microsoft/windowsservercore:1709 AS base
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN Invoke-WebRequest -OutFile stateful_aspnetcore_2.1.ps1 https://aka.ms/sfmesh_stateful_aspnetcore_2.1.ps1; .\stateful_aspnetcore_2.1.ps1;
WORKDIR /app
EXPOSE 20009

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY SmartHotel.Registration.KPI/SmartHotel.Registration.KPI.csproj SmartHotel.Registration.KPI/
RUN dotnet restore SmartHotel.Registration.KPI/SmartHotel.Registration.KPI.csproj
COPY . .
WORKDIR /src/SmartHotel.Registration.KPI
RUN dotnet build SmartHotel.Registration.KPI.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish SmartHotel.Registration.KPI.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "SmartHotel.Registration.KPI.dll"]