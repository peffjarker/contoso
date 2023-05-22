param location string = resourceGroup().location
param virtualNetworkName string
param subscriptionId string

resource hubDNS 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'privatelink.azurewebsites.net'
  location: location
}

resource hubDNSLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: hubDNS
  name: 'hubDNSLink'
  location: location
  properties: {
    virtualNetwork: {
      id: '/subscriptions/${subscriptionId}/resourceGroups/it-hub-eus2-net-rg/providers/Microsoft.Network/virtualNetworks/${virtualNetworkName}'
    }
    registrationEnabled: true
  }
}
