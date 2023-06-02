param location string

resource dbs 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: 'lg-dev-eus2-lgd-dbs'
  location: location
  properties: {
    administratorLogin: 'jeff'
    administratorLoginPassword: 'ToDo123!'
  }
  tags: {
    groupName: 'lg'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '1'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
  }
}

resource db 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  location: location
  sku: {
    name: 'Basic'
    capacity: 5
    family: 'Gen5'
    size: 'B_Gen5_1'
    tier: 'Basic'
  }
  parent: dbs
  name: 'lg-dev-eus2-lgd-db'
  tags: {
    groupName: 'lg'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '0'
    privacyLevel: '1'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
  }
}
