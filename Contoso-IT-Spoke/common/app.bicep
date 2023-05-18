param location string

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'lg-dev-eus2-lgd-appi'
  location: location
  properties: {
    Application_Type: 'web'
  }
  kind: 'web'
}