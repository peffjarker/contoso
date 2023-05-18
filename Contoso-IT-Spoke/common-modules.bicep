param location string

module kv '../Contoso-IT-Spoke/common/kv.bicep' = {
  name: 'kv'
  params: {
    location: location
  }
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}

module appInsights '../Contoso-IT-Spoke/common/app.bicep' = {
  name: 'appInsights'
  params: {
    location: location
  }
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}

module db '../Contoso-IT-Spoke/common/db.bicep' = {
  name: 'db'
  params: {
    location: location
  }
  scope: resourceGroup('lg-dev-eus2-lgd-rg')
}
