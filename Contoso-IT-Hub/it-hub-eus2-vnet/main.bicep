param location string

resource ithubvnet 'Microsoft.Network/virtualNetworks@2022-09-01' = {
  name: 'it-hub-eus2-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '192.168.0.0/20'
      ]
    }
    subnets: [
      {
        name: 'it-hub-eus2-dc-sn'
        properties: {
          networkSecurityGroup: {
            id: ithubeus2dcnsg.id
          }
          addressPrefixes: [
            '192.168.0.32/27'
          ]
        }
      }
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefixes: [
            '192.168.0.64/26'
          ]
        }

      }
      {
        name: 'it-hub-eus2-agw-sn'
        properties: {
          addressPrefixes: [
            '192.168.0.128/25'
          ]
        }
      }
      {
        name: 'it-hub-eus2-pep-sn'
        properties: {
          networkSecurityGroup: {
            id: ithubeus2pepnsg.id
          }
          addressPrefixes: [
            '192.168.1.0/25'
          ]
        }
      }
      {
        name: 'it-hub-eus2-mgt-sn'
        properties: {
          networkSecurityGroup: {
            id: ithubeus2mgtnsg.id
          }
          addressPrefixes: [
            '192.168.1.128/25'
          ]
        }
      }
    ]
  }
}

resource ithubeus2mgtnsg 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  name: 'it-hub-eus2-mgt-nsg'
  location: location
}

resource ithubeus2pepnsg 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  name: 'it-hub-eus2-pep-nsg'
  location: location
}

resource ithubeus2dcnsg 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  name: 'it-hub-eus2-dc-nsg'
  location: location
}
