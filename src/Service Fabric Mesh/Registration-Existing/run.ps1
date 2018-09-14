Param(
    [Parameter]
    [string]$AppInsightsKey
)

# Start SQL Express
docker run --rm -d --name sqldb -e sa_password="P@SSw0rd!@#$" -e ACCEPT_EULA=Y microsoft/mssql-server-windows-express

# Start wcf and web services
docker run --rm -d --name wcf -e DefaultConnection="Data Source=sqldb;Database=SmartHotel.Registration;User Id=sa;Password=P@SSw0rd!@#$" -e AppInsightsKey=$AppInsightsKey smarthotelwcf:mesh-1709
docker run --rm -d --name web -e WcfServiceUri=http://wcf:88/Service.svc -e AppInsightsKey=$AppInsightsKey -p:8080:80 smarthotelweb:mesh-1709