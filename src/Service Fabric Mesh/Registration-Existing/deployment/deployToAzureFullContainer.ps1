Param(
    [Parameter(Mandatory=$true)]
    [string]$location,
    [Parameter(Mandatory=$true)]
    [string]$AppInsightsKey
)

New-AzureRmResourceGroup -Name SmartHotel360AllContainers -Location $location
New-AzureRmResourceGroupDeployment -ResourceGroupName SmartHotel360AllContainers -TemplateFile ./ARMDeploy.json -TemplateParameterObject @{location = $location; AppInsightsKey = $AppInsightsKey}

az mesh network show --resource-group SmartHotel360AllContainers --name RegistrationNetwork