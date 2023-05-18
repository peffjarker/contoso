param location string
param saname string

resource ithubeus2lgdsapep 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: 'it-hub-eus2-pep-sa'
  location: location

  properties: {
    subnet: {
      id: ithubvnet.properties.subnets[3].id
    }
    privateLinkServiceConnections: [
      {
        name: sa.name
        properties: {
          privateLinkServiceId: sa.id
          groupIds: [
            'blob'
          ]
        }
      }
    ]
  }
}

resource ithubeus2lgdkvpep 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: 'it-hub-eus2-pep-kv'
  location: location
  properties: {
    subnet: {
      id: ithubvnet.properties.subnets[3].id
    }
    privateLinkServiceConnections: [
      {
        name: kv.name
        properties: {
          privateLinkServiceId: kv.id
          groupIds: [
            'vault'
          ]
        }
      }
    ]
  }
}

resource sa 'Microsoft.Storage/storageAccounts@2022-09-01' existing = {
  name: saname
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}

resource kv 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: 'it-hub-eus2-kv'
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}

resource ithubvnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  name: 'it-hub-eus2-vnet'
}
