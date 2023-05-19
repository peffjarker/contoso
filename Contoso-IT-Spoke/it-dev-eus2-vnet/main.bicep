param location string = resourceGroup().location

resource itdevvnet 'Microsoft.Network/virtualNetworks@2022-09-01' = {
  name: 'it-dev-eus2-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '192.168.32.0/20'
      ]
    }
    subnets: [
      {
        name: 'it-dev-eus2-pep-sn'
        properties: {
          addressPrefixes: [
            '192.168.32.0/26'
          ]
        }
      }
      {
        name: 'it-dev-eus2-asp-sn'
        properties: {
          addressPrefixes: [
            '192.168.32.64/26'
          ]
        }
      }
    ]
  }
}

resource itdeveus2pepnsg 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  name: 'it-dev-eus2-pep-nsg'
  location: location
}
