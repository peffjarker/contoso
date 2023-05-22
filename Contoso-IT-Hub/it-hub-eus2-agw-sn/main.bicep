param location string = 'eastus2'
param virtualNetworkNameResource string = 'it-hub-eus2-vnet'
param subnetName string = 'it-hub-eus2-agw-sn'
param accountId string = ''
param kvSecretId string
param certName string

@secure()
param issuerPassword string = ''
param organizationId string = ''
param identityId string

var agwId = resourceId('Microsoft.Network/applicationGateway', 'it-hub-eus2-agw')

@description('Name of the WebApp')
param siteName string = 'lg-dev-eus2-lgd-wa'

@description('Address prefix for the Virtual Network')
var addressPrefix = '192.168.0.0/21'

@description('Subnet prefix of the App Gateway')
var AppGatewaySubnetPrefix = '192.168.0.128/27'

@description('App Gateway Resource name')
var applicationGatewayNameResource = 'it-hub-eus2-agw'

@description('Public Ip Resource Name')
var publicIPAddressNameResource = '${siteName}-pip'

var subnetRef = resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkNameResource, subnetName)
var publicIPRef = publicIPAddressName.id

resource publicIPAddressName 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: publicIPAddressNameResource
  location: location
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  sku: {
    name: 'Standard'
  }
}

resource ApplicationGateway 'Microsoft.Network/applicationGateways@2022-07-01' = {
  name: 'it-hub-eus2-agw'
  location: location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${identityId}': {}
    }
  }
  properties: {
    sslCertificates: [
      {
        name: certName
        properties: {
          keyVaultSecretId: kvSecretId
        }
      }
    ]
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: subnetRef
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: publicIPRef
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'appGatewayFrontendPort'
        properties: {
          port: 443
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'appGatewayBackendPool'
        properties: {
          backendAddresses: [
            {
              ipAddress: AppService.properties.defaultHostName
            }
          ]
        }
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'appGatewayBackendHttpSettings'
        properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          pickHostNameFromBackendAddress: true
          probeEnabled: true
          probe: {
            id: resourceId('Microsoft.Network/applicationGateways/probes/', applicationGatewayNameResource, 'Probe1')
          }
        }
      }
    ]
    httpListeners: [
      {
        name: 'appGatewayHttpListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations/', applicationGatewayNameResource, 'appGatewayFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts/', applicationGatewayNameResource, 'appGatewayFrontendPort')
          }
          protocol: 'Https'
          sslCertificate: {
            id: resourceId('Microsoft.Network/applicationGateways/sslCertificates/', applicationGatewayNameResource, certName)
          }
        }
      }

    ]
    requestRoutingRules: [
      {
        name: 'rule1'
        properties: {
          priority: 100
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners/', applicationGatewayNameResource, 'appGatewayHttpListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools/', applicationGatewayNameResource, 'appGatewayBackendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection/', applicationGatewayNameResource, 'appGatewayBackendHttpSettings')
          }
        }
      }
    ]
    probes: [
      {
        name: 'Probe1'
        properties: {
          protocol: 'Http'
          path: '/'
          interval: 30
          timeout: 10
          unhealthyThreshold: 3
          minServers: 0
          pickHostNameFromBackendHttpSettings: true
        }
      }
    ]
  }
  dependsOn: [
    HubVNet
  ]
}

resource AppService 'Microsoft.Web/sites@2022-03-01' existing = {
  name: 'lg-dev-eus2-lgd-wa'
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}

resource HubVNet 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: 'it-hub-eus2-vnet'
}
