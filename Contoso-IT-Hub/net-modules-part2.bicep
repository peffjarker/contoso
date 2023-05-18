param location string = 'eastus2'
param hubMgtVMName string = 'hubeus2hmgt01'
param vmIpAddress string = '192.168.3.10'
param bstnName string = 'azurebastion'
param bstnIpAddress string = '192.168.0.80'
param dcName string = 'hubDc'
param dcIpAddress string = '192.168.0.42'
param pepName string = 'pep'
param pepIpAddress string = '192.168.2.1'
param kvName string = 'it-hub-eus2-kv'
param kvIpAddress string = '192.168.2.2'
param saName string = 'ithubeus2lgdsa'
param saIpAddress string = '192.168.2.3'
param logName string = 'it-hub-eus2-log'
param logIpAddress string = '192.168.1.5'
param rsvName string = 'it-hub-eus2-rsv'
param rsvIpAddress string = '192.168.6.10'
param hubVNetName string = 'it-hub-eus2-vnet'
param hubKVName string = 'it-hub-eus2-kv'
param subscriptionId string = 'e775033b-0b00-4fdd-a47a-6925b2127557'

module hubDNS 'common/dns.bicep' = {
  name: 'hubDNS'
  params: {
    bstnIpAddress: bstnIpAddress
    bstnName: bstnName
    dcIpAddress: dcIpAddress
    dcName: dcName
    hubMgtVMName: hubMgtVMName
    kvIpAddress: kvIpAddress
    kvName: kvName
    location: 'global'
    logIpAddress: logIpAddress
    logName: logName
    pepIpAddress: pepIpAddress
    pepName: pepName
    rsvIpAddress: rsvIpAddress
    rsvName: rsvName
    saIpAddress: saIpAddress
    saName: saName
    hubMgtVMIpAddress: vmIpAddress
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
