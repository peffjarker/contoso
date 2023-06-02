param location string

resource log 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'it-hub-eus2-log'
  location: location
  tags: {
    groupName: 'it'
    deployedBy: 'jeff.parker@neudesic.com'
    serviceLevel: '2'
    privacyLevel: '2'
    internalOwner: 'Contoso'
    supportContact: 'support@contoso.com'
    changeControl: 'no'
  }
}
