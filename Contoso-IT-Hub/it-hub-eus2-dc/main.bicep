param location string
param networkInterfaceName01 string
param networkInterfaceName02 string
param subnetName string
param virtualMachineName01 string
param virtualMachineName02 string
param virtualNetworkName string
param adminUsername string
param subscriptionId string

resource networkInterface_resource01 'Microsoft.Network/networkInterfaces@2022-09-01' = {
  name: networkInterfaceName01
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          subnet: {
            id: '/subscriptions/${subscriptionId}/resourceGroups/it-hub-eus2-net-rg/providers/Microsoft.Network/virtualNetworks/${virtualNetworkName}/subnets/${subnetName}'
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
  dependsOn: []
}

resource hubeus2hmgt01 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: virtualMachineName01
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2_v4'
    }
    storageProfile: {
      osDisk: {
        name: '${virtualMachineName01}-os-disk'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
        deleteOption: 'Delete'
      }
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-datacenter-gensecond'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface_resource01.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    osProfile: {
      computerName: virtualMachineName01
      adminUsername: adminUsername
      adminPassword: 'passwordToDo123!'
    }
  }
}

resource networkInterface_resource02 'Microsoft.Network/networkInterfaces@2022-09-01' = {
  name: networkInterfaceName02
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          subnet: {
            id: '/subscriptions/${subscriptionId}/resourceGroups/it-hub-eus2-net-rg/providers/Microsoft.Network/virtualNetworks/${virtualNetworkName}/subnets/${subnetName}'
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
  dependsOn: []
}

resource hubeus2hmgt02 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: virtualMachineName02
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2_v4'
    }
    storageProfile: {
      osDisk: {
        name: '${virtualMachineName02}-os-disk'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
        deleteOption: 'Delete'
      }
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-datacenter-gensecond'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface_resource02.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    osProfile: {
      computerName: virtualMachineName02
      adminUsername: adminUsername
      adminPassword: 'passwordToDo123!'
    }
  }
}

resource dcavailset 'Microsoft.Compute/availabilitySets@2022-11-01' = {
  name: 'it-hub-eus2-dc-avail'
  location: location
  tags: {
    tagName1: virtualMachineName01
    tagName2: virtualMachineName02
  }
  properties: {
    virtualMachines: [
      {
        id: hubeus2hmgt01.id
      }
      {
        id: hubeus2hmgt02.id
      }
    ]
  }
}
