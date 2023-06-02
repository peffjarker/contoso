module hubPeering 'common/peering.bicep' = {
  name: 'hub-peer'
  scope: resourceGroup('it-hub-eus2-net-rg')
}
