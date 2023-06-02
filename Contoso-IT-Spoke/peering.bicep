param hubVirtualNetworkName string = 'it-hub-eus2-vnet'
param devVirtualNetworkName string = 'it-dev-eus2-vnet'
param devNetRG string = 'it-dev-eus2-net-rg'
param hubNetRG string = 'it-hub-eus2-net-rg'

resource hubDevPeer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: 'it-hub-eus2-it-dev-eus2-vnet-peer'
  parent: itdevvnet
  properties: {
    peeringState: 'Connected'
    peeringSyncLevel: 'FullyInSync'
    remoteAddressSpace: {
      addressPrefixes: [
        '192.168.0.0/21'
      ]
    }
    remoteVirtualNetwork: {
      id: ithubvnet.id
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        '192.168.32.0/19'
      ]
    }
  }
}

resource itdevvnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  name: 'it-dev-eus2-vnet'
}

resource ithubvnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  name: 'it-hub-eus2-vnet'
  scope: resourceGroup('it-hub-eus2-net-rg')
}
