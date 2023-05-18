param location string = 'eastus2'

module hubVnet './it-hub-eus2-vnet/main.bicep' = {
  name: 'hubVnet'
  params: {
    location: location
  }
  scope: resourceGroup('it-hub-eus2-net-rg')
}
