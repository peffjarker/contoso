param location string = 'eastus2'

resource bastion_public_ip 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'it-hub-eus2-bstn-pip'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
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

resource bstn 'Microsoft.Network/bastionHosts@2022-07-01' = {
  name: 'it-hub-eus2-bstn'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipConfig'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: bastion_public_ip.id
          }
          subnet: {
            id: ithubvnet.properties.subnets[1].id
          }
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

resource ithubvnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  name: 'it-hub-eus2-vnet'
}
