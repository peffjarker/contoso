param location string = resourceGroup().location
param saname string

resource sa 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: saname
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
