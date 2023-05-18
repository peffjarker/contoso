param location string = 'eastus2'
param hubMgtNIC string = 'hubeus2hmgt01nic'
param hubMgtSN string = 'it-hub-eus2-mgt-sn'
param hubMgtVM string = 'hubeus2hmgt01'
param hubMgtVnet string = 'it-hub-eus2-vnet'
param hubMgtAdmin string = 'jeff'
param subscriptionId string = 'e775033b-0b00-4fdd-a47a-6925b2127557'
param dcNic01 string = 'hubeus2dc01nic'
param dcNic02 string = 'hubeus2dc02nic'
param dcSN string = 'it-hub-eus2-mgt-sn'
param dcVM01 string = 'hubeus2dc01'
param dcVM02 string = 'hubeus2dc02'
param dcVnet string = 'it-hub-eus2-vnet'
param dcAdmin string = 'jeff'

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

param tenantid string = '687f51c3-0c5d-4905-84f8-97c683a5b9d1'
param objectId string = '2b8cb38b-1904-496e-b8b8-c317fc855403'

module hubSa './common/sa.bicep' = {
  name: 'hubSa'
  params: {
    location: location
    saname: saName
  }
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}

module hubKV 'common/kv.bicep' = {
  name: 'hubKV'
  params: {
    location: location
    objectId: objectId
    tenantid: tenantid
  }
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}

module log 'common/log.bicep' = {
  name: 'log'
  params: {
    location: location
  }
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}

module rsv 'common/rsv.bicep' = {
  name: 'rsv'
  params: {
    location: location
  }
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}

module hubMgt './it-hub-eus2-mgt-sn/main.bicep' = {
  name: 'hubMgt'
  params: {
    location: location
    networkInterfaceName: hubMgtNIC
    subnetName: hubMgtSN
    virtualMachineName: hubMgtVM
    virtualNetworkName: hubMgtVnet
    adminUsername: hubMgtAdmin
    subscriptionId: subscriptionId
  }
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}
