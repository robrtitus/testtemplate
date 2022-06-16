@description('Specifies the location for resources.')
param location string = 'westus'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'toylaunchstorage092384'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    allowCrossTenantReplication: false
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: 'toy-service-plan-1'
  location: location
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2021-03-01' = {
  name: 'toy-product-launch-1'
  location: location
  properties: {
   httpsOnly: true
   serverFarmId: appServicePlan.id 
  }
}
