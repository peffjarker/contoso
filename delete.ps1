Remove-AzResourceGroup -Name 'it-hub-eus2-dc-rg' -Force
Remove-AzResourceGroup -Name 'it-hub-eus2-mgt-rg' -Force
Remove-AzResourceGroup -Name 'it-hub-eus2-net-rg' -Force
az keyvault purge --location eastus2 --name it-hub-eus2-kv
Remove-AzResourceGroup -Name 'it-dev-eus2-net-rg' -Force
Remove-AzResourceGroup -Name 'lg-dev-eus2-lgd-rg' -Force
az keyvault purge --location eastus2 --name lg-dev-eus2-lgd-kv