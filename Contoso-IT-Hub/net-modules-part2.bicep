param location string = 'eastus2'
param saName string = 'ithubeus2lgdsa'
param hubVNetName string = 'it-hub-eus2-vnet'
param subscriptionId string = 'e775033b-0b00-4fdd-a47a-6925b2127557'

module hubDNS 'common/dns.bicep' = {
  name: 'hubDNS'
  params: {
    location: location
    subscriptionId: subscriptionId
    virtualNetworkName: hubVNetName
  }
  scope: resourceGroup('it-hub-eus2-net-rg')
}

// module bstn './it-hub-eus2-bstn/main.bicep' = {
//   name: 'bstn'
//   params: {
//     location: location
//   }
//   scope: resourceGroup('it-hub-eus2-net-rg')
// }

module pep 'it-hub-eus2-pep-sn/main.bicep' = {
  name: 'pep'
  params: {
    location: location
    saname: saName
  }
  scope: resourceGroup('it-hub-eus2-net-rg')
}
