param location string = 'eastus2'
param dcNic01 string = 'hubeus2dc01nic'
param dcNic02 string = 'hubeus2dc02nic'
param dcSN string = 'it-hub-eus2-dc-sn'
param dcVM01 string = 'hubeus2dc01'
param dcVM02 string = 'hubeus2dc02'
param dcVnet string = 'it-hub-eus2-vnet'
param dcAdmin string = 'jeff'
param subscriptionId string = 'e775033b-0b00-4fdd-a47a-6925b2127557'

module dc './it-hub-eus2-dc/main.bicep' = {
  name: 'dc'
  params: {
    location: location
    adminUsername: dcAdmin
    networkInterfaceName01: dcNic01
    networkInterfaceName02: dcNic02
    subnetName: dcSN
    virtualMachineName01: dcVM01
    virtualMachineName02: dcVM02
    virtualNetworkName: dcVnet
    subscriptionId: subscriptionId
  }
  scope: resourceGroup('it-hub-eus2-dc-rg')
}
