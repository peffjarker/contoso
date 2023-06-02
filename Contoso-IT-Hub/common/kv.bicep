param location string
param tenantid string
param objectId string

resource kv 'Microsoft.KeyVault/vaults@2022-02-01-preview' = {
  name: 'it-hub-eus2-kv'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: tenantid
    accessPolicies: [
      {
        objectId: objectId
        tenantId: tenantid
        permissions: {
          secrets: [
            'all'
          ]
          certificates: [
            'all'
          ]
          keys: [
            'all'
          ]
          storage: [
            'all'
          ]
        }
      }
    ]
  }
  tags: {
    groupName: 'it'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '0'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
  }
}
