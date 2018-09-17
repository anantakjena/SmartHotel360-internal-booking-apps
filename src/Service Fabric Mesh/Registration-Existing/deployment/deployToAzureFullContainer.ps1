Param(
    [Parameter(Mandatory=$true)]
    [string]$location,
    [Parameter(Mandatory=$true)]
    [string]$AppInsightsKey = '',
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName
)

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $location
New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile ./ARMDeploy.json -TemplateParameterObject @{location = $location; AppInsightsKey = $AppInsightsKey}

az mesh network show --resource-group $ResourceGroupName --name RegistrationNetwork