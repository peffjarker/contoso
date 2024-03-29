param hubVirtualNetworkName string = 'it-hub-eus2-vnet'
param devVirtualNetworkName string = 'it-dev-eus2-vnet'
param devNetRG string = 'it-dev-eus2-net-rg'
param hubNetRG string = 'it-hub-eus2-net-rg'

resource vaultDNS 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'privatelink.vaultcore.azure.net'
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

resource vaultDNSLinkHub 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: 'vaultDNSLinkHub'
  parent: vaultDNS
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

resource vaultDNSLinkDev 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: 'vaultDNSLinkDev'
  parent: vaultDNS
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

resource saDNS 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'privatelink.blob.core.windows.net'
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

resource saDNSLinkHub 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: 'saDNSLinkHub'
  parent: saDNS
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

resource saDNSLinkDev 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: 'saDNSLinkDev'
  parent: saDNS
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
