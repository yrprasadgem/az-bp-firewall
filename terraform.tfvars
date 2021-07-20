###############################################################################
# Vent
###############################################################################


vnet_resource_group_name        = "rgkt-nprd-aksapp01"
vnet_name                       = "vnetkt-fw-aks"
#vnet_dns_servers               = "dns server name"
# Adding Standard DDoS Plan, and custom DNS servers (Optional)
vnet_ddos_enable                = "true"
#vnet_network_mananger_name     = "network_manager_name"
ddos_plan_name                  = "ddos-prd-aksapp01"
vnet_ddos_id                    = "/subscriptions/b3f72110-ee35-4c84-ab6a-5189f3744372/resourceGroups/rg-prd-aksapp01/providers/Microsoft.Network/ddosProtectionPlans/ddos-prd-aksapp01"

app_ref = "ktpoccorda"

buAdCode = "ktpoccontour"

subsCode = "nonprod subscription" #subscription code

environment = "ktpoc"

resource_group_name = "rgkt-nprd-aksapp01"

##firewall public ip
aks_azure_firewall_public_ip_name     = "pipkt-nprd-fwaks"
aks_azure_firewall_public_ip_name_2     = "pipkt-nprd-fwaks2"
aks_azure_firewall_public_ip_name_3     = "pipkt-nprd-fwaks3"
aks_azure_firewall_allocation_method  = "Static"
aks_azure_firewall_sku                = "Standard"

##aks firewall
aks_azure_firewall_name   = "fwkt-nprd-aks"

##aks firewall ip config name
aks_azure_firewall_ip_configuration_name  = "configuration"
aks_azure_firewall_ip_configuration_name_2  = "configuration2"
aks_azure_firewall_ip_configuration_name_3  = "configuration3"

#route configuration

aks_route_table_name  = "nprd_akskt_app_routetable"
aks_azure_route_address_prefix  = "0.0.0.0/0"
aks_azure_route_name  = "nprd_akskt_app_route"
aks_azure_route_next_hop_type= "VirtualAppliance"

##firewall DNAT rules

aks_azurerm_firewall_dnat_rules                 = []

##firewall SNAT rules
aks_azurerm_firewall_snat_rules                   = []
