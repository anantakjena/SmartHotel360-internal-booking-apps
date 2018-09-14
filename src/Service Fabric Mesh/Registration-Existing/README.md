# Build SmartHotel360 Internal Booking apps for Service Fabric Mesh

This folder contains a Visual Studio solution (./SmartHotel.Registration.sln) which contains two ASP.NET services: SmartHotel.Registration (WebForms) and SmartHotel.Registration.Wcf (WCF)

The folder also contains the following directories:

|Directory / File|Content|
|---|---|
| [deployment](./deployment) |ARM Templates and scripts to deploy to Azure|
| build.ps1 | Build the two ASP.NET projects and container images |
| run.ps1 | Run the containers and SQL Express in a container locally |
| stop.ps1 | Stops the three containers locally |

## Build app and containers an existing .NET application

Run the following commands:

1. Run the ./build.ps1 script to build the app and containers

1. Run the ./run.ps1 script to run the containers locally (this includes SQL Express in a container)

1. Browse to http://localhost:8080

1. Run the ./stop.ps1 script to stop all three containers

## Deploy to Azure Service Fabric Mesh

You can either use the already available container images, or build and push your own to a container registry.

To deploy:

- Run the ./deployment/deployToAzureSQLAzure.ps1 script, to provision and Azure SQL Database and deploy the application in containers to Mesh

OR

- Run the ./deployment/deployToAzureFullContainer.ps1 script, to run the app and the SQL server in containers in Mesh