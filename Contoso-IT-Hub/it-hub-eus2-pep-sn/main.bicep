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
  tags: {
    groupName: 'it'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '1'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
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
  tags: {
    groupName: 'it'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '1'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
  }
}

resource dnsZoneGroupKV 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: 'dnsZoneGroupKV'
  parent: ithubeus2lgdkvpep
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink.vaultcore.azure.net'
        properties: {
          privateDnsZoneId: resourceId('it-hub-eus2-net-rg', 'Microsoft.Network/privateDnsZones', 'privatelink.vaultcore.azure.net')
        }
      }
    ]
  }
}

resource dnsZoneGroupSA 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: 'dnsZoneGroupSA'
  parent: ithubeus2lgdsapep
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink.blob.core.windows.net'
        properties: {
          privateDnsZoneId: resourceId('it-hub-eus2-net-rg', 'Microsoft.Network/privateDnsZones', 'privatelink.blob.core.windows.net')
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
