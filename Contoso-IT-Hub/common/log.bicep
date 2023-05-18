param location string

resource log 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'it-hub-eus2-log'
  location: location
}
