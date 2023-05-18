param location string

resource itdeveus2lgdsapip 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: 'it-dev-eus2-pep-sa'
  location: location

  properties: {
    subnet: {
      id: ithubvnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: kv.name
        properties: {
          privateLinkServiceId: kv.id
          groupIds: [
            'blob'
          ]
        }
      }
    ]
  }
}

resource itdeveus2lgdkvpip 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: 'it-dev-eus2-pep-kv'
  location: location

  properties: {
    subnet: {
      id: ithubvnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: dbs.name
        properties: {
          privateLinkServiceId: dbs.id
          groupIds: [
            'vault'
          ]
        }
      }
    ]
  }
}

resource ithubeus2lgdkvpip 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: 'lg-dev-eus2-lgd-pep-wa'
  location: location

  properties: {
    subnet: {
      id: ithubvnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: appService.name
        properties: {
          privateLinkServiceId: appService.id
          groupIds: [
            'webApp'
          ]
        }
      }
    ]
  }
}

resource kv 'Microsoft.KeyVault/vaults@2022-02-01-preview' existing = {
  name: 'it-dev-eus2-kv'
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}

resource dbs 'Microsoft.Sql/servers@2022-05-01-preview' existing = {
  name: 'lg-dev-eus2-lgd-dbs'
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}

resource appService 'Microsoft.Sql/servers@2022-05-01-preview' existing = {
  name: 'lg-dev-eus2-lgd-wa'
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}

resource ithubvnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  name: 'it-dev-eus2-vnet'
}
