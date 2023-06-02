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
          networkSecurityGroup: {
            id: itdeveus2pepnsg.id
          }
          addressPrefixes: [
            '192.168.32.0/26'
          ]
        }
      }
      {
        name: 'it-dev-eus2-asp-sn'
        properties: {
          networkSecurityGroup: {
            id: itdeveus2aspnsg.id
          }
          delegations: [
            {
              name: 'delegation'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
          addressPrefixes: [
            '192.168.32.64/26'
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

resource itdeveus2pepnsg 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  name: 'it-dev-eus2-pep-nsg'
  location: location
}

resource itdeveus2aspnsg 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  name: 'it-dev-eus2-asp-nsg'
  location: location
}
