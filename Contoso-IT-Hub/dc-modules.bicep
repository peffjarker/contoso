param location string = 'eastus2'
param dcNIC01 string = 'hubeus2dc01nic'
param dcNIC02 string = 'hubeus2dc02nic'
param dcSubnet string = 'it-hub-eus2-dc-sn'
param dcVM01 string = 'hubeus2dc01'
param dcVM02 string = 'hubeus2dc02'
param hubVNet string = 'it-hub-eus2-vnet'
param dcAdmin string = 'jeff'
param subscriptionId string = 'e775033b-0b00-4fdd-a47a-6925b2127557'

module dc './it-hub-eus2-dc/main.bicep' = {
  name: 'dc'
  params: {
    location: location
    adminUsername: dcAdmin
    networkInterfaceName01: dcNIC01
    networkInterfaceName02: dcNIC02
    subnetName: dcSubnet
    virtualMachineName01: dcVM01
    virtualMachineName02: dcVM02
    virtualNetworkName: hubVNet
    subscriptionId: subscriptionId
  }
  scope: resourceGroup('it-hub-eus2-dc-rg')
}
