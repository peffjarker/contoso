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
          addressPrefixes: [
            '192.168.32.0/26'
          ]
        }
      }
      {
        name: 'it-dev-eus2-asp-sn'
        properties: {
          addressPrefixes: [
            '192.168.32.64/26'
          ]
        }
      }
    ]
  }
}

resource itdeveus2pepnsg 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  name: 'it-dev-eus2-pep-nsg'
  location: location
}

// resource hubDevPeer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
//   name: 'it-hub-eus2-it-dev-eus2-vnet-peer'
//   parent: itdevvnet
//   properties: {
//     peeringState: 'Connected'
//     peeringSyncLevel: 'FullyInSync'
//     remoteAddressSpace: {
//       addressPrefixes: [
//         '192.168.0.0/21'
//       ]
//     }
//     remoteVirtualNetwork: {
//       id: ithubvnet.id
//     }
//     remoteVirtualNetworkAddressSpace: {
//       addressPrefixes: [
//         '192.168.32.0/19'
//       ]
//     }
//   }
// }

resource ithubvnet 'Microsoft.Network/virtualNetworks@2022-09-01' existing = {
  name: 'it-hub-eus2-vnet'
}
