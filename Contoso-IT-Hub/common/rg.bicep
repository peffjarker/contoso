param location string

targetScope = 'subscription'

resource netRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'it-hub-eus2-net-rg'
  location: location
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

resource mgtRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'it-hub-eus2-mgt-rg'
  location: location
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

resource dcRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'it-hub-eus2-dc-rg'
  location: location
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
