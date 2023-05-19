param location string

resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'managedIdentity'
  location: location
}

resource kv 'Microsoft.KeyVault/vaults@2022-02-01-preview' existing = {
  name: 'it-hub-eus2-kv'
}

resource kvPermissions 'Microsoft.KeyVault/vaults/accessPolicies@2023-02-01' = {
  name: 'add'
  parent: kv
  properties: {
    accessPolicies: [
      {
        objectId: identity.properties.principalId
        permissions: {
          certificates: [
            'all'
          ]
          secrets: [
            'all'
          ]
          keys: [
            'all'
          ]
          storage: [
            'all'
          ]
        }
        tenantId: subscription().tenantId
      }
    ]
  }
}

output servicePrincipleId string = identity.id
