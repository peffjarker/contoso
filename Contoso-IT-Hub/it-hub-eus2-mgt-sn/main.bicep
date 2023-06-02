param location string
param networkInterfaceName string
param subnetName string
param virtualMachineName string
param virtualNetworkName string
param adminUsername string
param subscriptionId string

resource networkInterface_resource 'Microsoft.Network/networkInterfaces@2022-09-01' = {
  name: networkInterfaceName
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
  tags: {
    groupName: 'it'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '1'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
  }
}

resource hubeus2hmgt01 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: virtualMachineName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2_v4'
    }
    storageProfile: {
      osDisk: {
        name: '${virtualMachineName}-os-disk'
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
          id: networkInterface_resource.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    osProfile: {
      computerName: virtualMachineName
      adminUsername: adminUsername
      adminPassword: 'passwordToDo123!'
    }
  }
  tags: {
    groupName: 'it'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '1'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
  }
}
