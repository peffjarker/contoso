param location string = resourceGroup().location
param tenantid string = '687f51c3-0c5d-4905-84f8-97c683a5b9d1'
param objectId string = '2b8cb38b-1904-496e-b8b8-c317fc855403'

resource kv 'Microsoft.KeyVault/vaults@2022-02-01-preview' = {
  name: 'lg-dev-eus2-lgd-kv'
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
}
