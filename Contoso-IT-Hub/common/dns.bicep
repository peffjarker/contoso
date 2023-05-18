param hubMgtVMName string
param hubMgtVMIpAddress string
param bstnName string
param bstnIpAddress string
param dcName string
param dcIpAddress string
param pepName string
param pepIpAddress string
param kvName string
param kvIpAddress string
param saName string
param saIpAddress string
param logName string
param logIpAddress string
param rsvName string
param rsvIpAddress string
param location string
param virtualNetworkName string
param subscriptionId string

resource hubDNS 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'hub.contoso.com'
  location: location
}

resource hubDNSLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: hubDNS
  name: 'hubDNSLink'
  location: location
  properties: {
    virtualNetwork: {
      id: '/subscriptions/${subscriptionId}/resourceGroups/it-hub-eus2-net-rg/providers/Microsoft.Network/virtualNetworks/${virtualNetworkName}'
    }
    registrationEnabled: true
  }
}

// resource hubMgtDNSRecord 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
//   parent: hubDNS
//   name: hubMgtVMName
//   properties: {
//     aRecords: [
//       {
//         ipv4Address: hubMgtVMIpAddress
//       }
//     ]
//   }
// }

// resource bstnDnsRecord 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
//   parent: hubDNS
//   name: bstnName
//   properties: {
//     aRecords: [
//       {
//         ipv4Address: bstnIpAddress
//       }
//     ]
//   }
// }

// resource dcDnsRecord 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
//   parent: hubDNS
//   name: dcName
//   properties: {
//     aRecords: [
//       {
//         ipv4Address: dcIpAddress
//       }
//     ]
//   }
// }

// resource pepDnsRecord 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
//   parent: hubDNS
//   name: pepName
//   properties: {
//     aRecords: [
//       {
//         ipv4Address: pepIpAddress
//       }
//     ]
//   }
// }

// resource kvDnsRecord 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
//   parent: hubDNS
//   name: kvName
//   properties: {
//     aRecords: [
//       {
//         ipv4Address: kvIpAddress
//       }
//     ]
//   }
// }

// resource saDnsRecord 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
//   parent: hubDNS
//   name: saName
//   properties: {
//     aRecords: [
//       {
//         ipv4Address: saIpAddress
//       }
//     ]
//   }
// }

// resource logDnsRecord 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
//   parent: hubDNS
//   name: logName
//   properties: {
//     aRecords: [
//       {
//         ipv4Address: logIpAddress
//       }
//     ]
//   }
// }

// resource rsvDnsRecord 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
//   parent: hubDNS
//   name: rsvName
//   properties: {
//     aRecords: [
//       {
//         ipv4Address: rsvIpAddress
//       }
//     ]
//   }
// }
