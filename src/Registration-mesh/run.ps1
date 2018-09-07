# Start SQL Express
docker run --rm -d --name sqldb -e sa_password="P@SSw0rd!@#$" -e ACCEPT_EULA=Y microsoft/mssql-server-windows-express

# Start wcf and web services
docker run --rm -d --name wcf -e DefaultConnection="Data Source=sqldb;Database=SmartHotel.Registration;User Id=sa;Password=P@SSw0rd!@#$" -e AppInsightsKey=d0566793-5a89-4ea1-b725-e71409019844 mikkelhegn/smarthotelwcf:mesh-1709-KB4343897
docker run --rm -d --name web -e WcfServiceUri=http://wcf:88/Service.svc -e AppInsightsKey=d0566793-5a89-4ea1-b725-e71409019844 -p:8080:80 mikkelhegn/smarthotelweb:mesh-1709-KB4343897

Write-Host "cUrl'ing the web service for statuscode"
curl http://localhost:8080 | $_.StatusCode