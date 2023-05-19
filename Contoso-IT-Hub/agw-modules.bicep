param location string = resourceGroup().location

module identity './common/identity.bicep' = {
  name: 'identity'
  params: {
    location: location
  }
  scope: resourceGroup('it-hub-eus2-mgt-rg')
}

module cert './common/kv-cert.bicep' = {
  name: 'cert'
  params: {
    location: location
    identityId: identity.outputs.servicePrincipleId
  }
  scope: resourceGroup('it-hub-eus2-mgt-rg')
  dependsOn: [
    identity
  ]
}

module agw './it-hub-eus2-agw-sn/main.bicep' = {
  name: 'agw'
  params: {
    location: location
    identityId: identity.outputs.servicePrincipleId
    kvSecretId: cert.outputs.certificateSecretIdUnversioneds[0][0]
    certName: 'ssl'
  }
  dependsOn: [
    cert
  ]
}
