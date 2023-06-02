param devVirtualNetworkName string = 'it-dev-eus2-vnet'
param devNetRG string = 'it-dev-eus2-net-rg'

resource hubDevPeer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: 'it-hub-eus2-it-dev-eus2-vnet-peer'
  parent: ithubvnet
  properties: {
    peeringState: 'Connected'
    peeringSyncLevel: 'FullyInSync'
    remoteAddressSpace: {
      addressPrefixes: [
        '192.168.0.0/21'
      ]
    }
    remoteVirtualNetwork: {
      id: resourceId(devNetRG, 'Microsoft.Network/virtualNetworks', devVirtualNetworkName)
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        '192.168.32.0/19'
      ]
    }
  }
}

resource ithubvnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  name: 'it-hub-eus2-vnet'
}
