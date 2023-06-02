param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'lg-dev-eus2-lgd-asp'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  tags: {
    groupName: 'lg'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '1'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
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
    virtualNetworkSubnetId: resourceId('it-dev-eus2-net-rg', 'Microsoft.Network/virtualNetworks/subnets', 'it-dev-eus2-vnet', 'it-dev-eus2-asp-sn')
  }
  tags: {
    groupName: 'lg'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '1'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
  }
}
