param location string

targetScope = 'subscription'

resource netRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'it-hub-eus2-net-rg'
  location: location
}

resource mgtRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'it-hub-eus2-mgt-rg'
  location: location
}

resource dcRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'it-hub-eus2-dc-rg'
  location: location
}
