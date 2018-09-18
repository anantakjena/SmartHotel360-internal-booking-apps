Param(
    [Parameter(Mandatory=$true)]
    [string]$location,
    [Parameter(Mandatory=$false)]
    [string]$AppInsightsKey = "",
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)]
    [int]$WebReplicaCount
)

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $location
New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile ./ARMDeploySQLAzure.json -TemplateParameterObject @{location = $location; AppInsightsKey = $AppInsightsKey; WebReplicaCount = $WebReplicaCount}

az mesh network show --resource-group $ResourceGroupName --name RegistrationNetwork