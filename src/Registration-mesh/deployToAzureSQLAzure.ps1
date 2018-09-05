Param(
    [Parameter(Mandatory=$true)]
    [string]$location,
    [Parameter(Mandatory=$true)]
    [string]$AppInsightsKey
)

New-AzureRmResourceGroup -Name SmartHotel360wSQLdb -Location $location
New-AzureRmResourceGroupDeployment -ResourceGroupName SmartHotel360wSQLdb -TemplateFile ./ARMDeploySQLAzure.json -TemplateParameterObject @{location = $location; AppInsightsKey = $AppInsightsKey}

az mesh network show --resource-group SmartHotel360wSQLdb --name RegistrationNetwork