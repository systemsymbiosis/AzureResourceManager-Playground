﻿
### Define variables
{

$location = 'West Europe'
$resourceGroupName = 'Testing-AzureResourceManager-Playground'
$resourceDeploymentName = 'effectiveomputing-vault'
$keyVaultName = 'effectiveomputing-vault'
$password = 'Pa%%word@!239!$^876'
$parameterName = 'vmAdminPassword'

}

### Create Resource Group
{

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location `
    -Verbose -Force

}

### Create KeyVault
{

New-AzureRmKeyVault `
    -VaultName $keyVaultName `
    -ResourceGroupName $resourceGroupName `
    -Location $location `
    -EnabledForTemplateDeployment

}

### Add Password to KeyVault
{

$adminPass = ConvertTo-SecureString `
    -String $password `
    -AsPlainText -Force

Set-AzureKeyVaultSecret `
    -VaultName $keyVaultName `
    -Name $parameterName `
    -SecretValue $adminPass

}

### Get Subscription ID
{

(Get-AzureRmSubscription).SubscriptionId

}