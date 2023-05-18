module hubPeering 'common/peering.bicep' = {
  name: 'pe'
  scope: resourceGroup('it-hub-eus2-net-rg')
}
