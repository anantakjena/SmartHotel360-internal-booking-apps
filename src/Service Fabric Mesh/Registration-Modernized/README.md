# Build SmartHotel360 Internal Booking apps for Service Fabric Mesh

## Build app and containers an existing .NET application

From the /src/Registration-mesh folder run the following commands:

1. Run the ./build.ps1 script to build the app and containers

1. Run the ./run.ps1 script to run the containers locally (this includes SQL Express in a container)

1. Browse to http://localhost:8080

1. Run the ./stop.ps1 script to stop all three containers

## Deploy to Azure Service Fabric Mesh

You can either use the already available container images, or build and push your own to docker hub.

To deploy, from the /src/Registration-mesh folder:

- Run the ./deployToAzureFullContainer.ps1 script, to run the app and the SQL server in containers in Mesh

OR

- Run the ./deployToAzureSQLAzure.ps1 script, to provision and Azure SQL Database and deploy the application in containers to Mesh