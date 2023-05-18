param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'lg-dev-eus2-lgd-asp'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
}

resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: 'lg-dev-eus2-lgd-wa'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }

}
