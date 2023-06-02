param location string = resourceGroup().location

resource itdeveus2lgddbpep 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: 'it-dev-eus2-lgd-db-pep'
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
            'sqlServer'
          ]
        }
      }
    ]
  }
}

resource itdeveus2lgdkvpep 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: 'it-dev-eus2-kv-pep'
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
            'vault'
          ]
        }
      }
    ]
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

resource ithubeus2lgdwapep 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: 'lg-dev-eus2-lgd-wa-pep'
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
            'sites'
          ]
        }
      }
    ]
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

resource dnsZoneGroupWA 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: 'dnsZoneGroupWA'
  parent: ithubeus2lgdwapep
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink.azurewebsites.net'
        properties: {
          privateDnsZoneId: resourceId('it-hub-eus2-net-rg', 'Microsoft.Network/privateDnsZones', 'privatelink.azurewebsites.net')
        }
      }
    ]
  }
}

resource dnsZoneGroupDB 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: 'dnsZoneGroupDB'
  parent: itdeveus2lgddbpep
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink.database.windows.net'
        properties: {
          privateDnsZoneId: resourceId('it-hub-eus2-net-rg', 'Microsoft.Network/privateDnsZones', 'privatelink.database.windows.net')
        }
      }
    ]
  }
}

resource dnsZoneGroupKV 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: 'dnsZoneGroupKV'
  parent: itdeveus2lgdkvpep
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

resource dbs 'Microsoft.Sql/servers@2022-05-01-preview' existing = {
  name: 'lg-dev-eus2-lgd-dbs'
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}

resource kv 'Microsoft.KeyVault/vaults@2022-02-01-preview' existing = {
  name: 'it-hub-eus2-kv'
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}

resource appService 'Microsoft.Web/sites@2021-02-01' existing = {
  name: 'lg-dev-eus2-lgd-wa'
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}

resource ithubvnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  name: 'it-dev-eus2-vnet'
}
