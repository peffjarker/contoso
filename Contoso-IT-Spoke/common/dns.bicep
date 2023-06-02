param hubVirtualNetworkName string = 'it-hub-eus2-vnet'
param devVirtualNetworkName string = 'it-dev-eus2-vnet'
param devNetRG string = 'it-dev-eus2-net-rg'
param hubNetRG string = 'it-hub-eus2-net-rg'

resource appDNS 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'privatelink.azurewebsites.net'
  location: 'global'
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

resource appDNSLinkHub 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: appDNS
  name: 'appDNSLinkHub'
  location: 'global'
  properties: {
    virtualNetwork: {
      id: resourceId(hubNetRG, 'Microsoft.Network/virtualNetworks', hubVirtualNetworkName)
    }
    registrationEnabled: true
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

resource appDNSLinkDev 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: appDNS
  name: 'appDNSLinkDev'
  location: 'global'
  properties: {
    virtualNetwork: {
      id: resourceId(devNetRG, 'Microsoft.Network/virtualNetworks', devVirtualNetworkName)
    }
    registrationEnabled: true
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

resource dbDNS 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'privatelink.database.windows.net'
  location: 'global'
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

resource dbDNSLinkHub 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: 'dbDNSLinkHub'
  parent: dbDNS
  location: 'global'
  properties: {
    virtualNetwork: {
      id: resourceId(hubNetRG, 'Microsoft.Network/virtualNetworks', hubVirtualNetworkName)
    }
    registrationEnabled: false
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

resource dbDNSLinkDev 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: 'dbDNSLinkDev'
  parent: dbDNS
  location: 'global'
  properties: {
    virtualNetwork: {
      id: resourceId(devNetRG, 'Microsoft.Network/virtualNetworks', devVirtualNetworkName)
    }
    registrationEnabled: false
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
