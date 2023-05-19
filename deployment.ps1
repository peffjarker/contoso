# New-AzDeployment -TemplateFile .\Contoso-IT-Hub\common\rg.bicep -verbose -location eastus2 -locationFromTemplate eastus2

# New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Hub\net-modules-part1.bicep -ResourceGroupName 'it-hub-eus2-net-rg' -verbose

# New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Hub\dc-modules.bicep -ResourceGroupName 'it-hub-eus2-dc-rg' -verbose

# New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Hub\mgt-modules.bicep -ResourceGroupName 'it-hub-eus2-mgt-rg' -verbose

# New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Hub\net-modules-part2.bicep -ResourceGroupName 'it-hub-eus2-net-rg' -verbose

# New-AzDeployment -TemplateFile .\Contoso-IT-Spoke\common\rg.bicep -verbose -location eastus2 -locationFromTemplate eastus2

# New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Spoke\it-dev-eus2-vnet\main.bicep -ResourceGroupName 'it-dev-eus2-net-rg' -verbose

New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Spoke\common-modules.bicep -ResourceGroupName 'it-dev-eus2-net-rg' -verbose         

New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Spoke\it-dev-eus2-asp-sn\main.bicep -ResourceGroupName 'lg-dev-eus2-lgd-rg' -verbose

New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Spoke\it-dev-eus2-pep-sn\main.bicep -ResourceGroupName 'it-dev-eus2-net-rg' -verbose

New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Hub\peering-module.bicep -ResourceGroupName 'it-hub-eus2-net-rg' -verbose

New-AzResourceGroupDeployment -Mode Incremental -TemplateFile .\Contoso-IT-Spoke\peering.bicep -ResourceGroupName 'it-dev-eus2-net-rg' -verbose
