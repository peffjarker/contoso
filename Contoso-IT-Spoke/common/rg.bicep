param location string = 'eastus2'

targetScope = 'subscription'

resource lgRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'lg-dev-eus2-lgd-rg'
  location: location
}

resource spokeNetRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'it-dev-eus2-net-rg'
  location: location
}
