param location string

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'lg-dev-eus2-lgd-appi'
  location: location
  properties: {
    Application_Type: 'web'
  }
  kind: 'web'
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
