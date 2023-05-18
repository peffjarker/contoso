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
            'get'
            'list'
          ]
        }
      }
    ]
  }
}
