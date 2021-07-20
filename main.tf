########################################
# VNET
########################################
module "azure_vnet_creation" {
  source = "git::git@bitbucket.org:contournetworkdelivery/azure-vnet-module.git?ref=firewall_vnet"

  # Vnet creation
  vnet_address_space             = ["11.149.0.0/16"]
  vnet_resource_group_name       = var.resource_group_name
  vnet_name                      = var.vnet_name
  vnet_location                  = var.azure_regions_map["az1"]
  #vnet_dns_servers               = var.vnet_dns_servers
  vnet_tags                      = var.resource_tags
  # Adding Standard DDoS Plan, and custom DNS servers (Optional)
  vnet_ddos_enable               = var.vnet_ddos_enable
  ddos_plan_name                 = var.ddos_plan_name
  vnet_ddos_id                   = var.vnet_ddos_id
  #Netwrok manager
  #vnet_network_mananger_name    = var.vnet_network_mananger_name

  # Multiple Subnets, Service delegation, Service Endpoints, Network security groups
  # These are default subnets with required configuration, check README.md for more details

  # Azure firewall subnet updated
  firewall_subnet_address_prefix  = ["11.149.0.0/24"]
  firewall_service_endpoints      = []
}
########################################
# Azure Firewall
########################################

module "aks_firewall" {
  source = "git::git@bitbucket.org:contournetworkdelivery/azure-aks-firewall.git?ref=int_fw_module"
  #azure public ip 1
  aks_azure_firewall_public_ip_name               = var.aks_azure_firewall_public_ip_name
  #azure public ip 2
  aks_azure_firewall_public_ip_name_2             = var.aks_azure_firewall_public_ip_name_2
  #azure public ip 3
  aks_azure_firewall_public_ip_name_3             = var.aks_azure_firewall_public_ip_name_3
  aks_azure_firewall_public_ip_name_location      = var.azure_regions_map["az1"]
  aks_azure_firewall_public_ip_resource_group_name= var.resource_group_name
  aks_azure_firewall_public_ip_allocation_method  = var.aks_azure_firewall_allocation_method
  aks_azure_firewall_public_ip_sku                = var.aks_azure_firewall_sku
  aks_azure_firewall_public_ip_resource_tags      = var.resource_tags
  #azure firewall
  aks_azure_firewall_name                 = var.aks_azure_firewall_name
  aks_azure_firewall_location             = var.azure_regions_map["az1"]
  aks_azure_firewall_resource_group_name  = var.resource_group_name
  aks_azure_firewall_resource_tags        = var.resource_tags
  fw_subnet_id                            = "${module.azure_vnet_creation.fw_subnet_id}"
  #firewall ip configuration 1
  aks_azure_firewall_ip_configuration_name= var.aks_azure_firewall_ip_configuration_name

  #firewall ip configuration 2
  aks_azure_firewall_ip_configuration_name_2= var.aks_azure_firewall_ip_configuration_name_2

  #firewall ip configuration 3
  aks_azure_firewall_ip_configuration_name_3= var.aks_azure_firewall_ip_configuration_name_3

  #firewall dnat rule collection
  aks_azurerm_firewall_dnat_rule_collection_rules   = var.aks_azurerm_firewall_dnat_rules
  #firewall snat (netowrk) rule collection
  aks_azurerm_firewall_snat_rule_collection_rules   = var.aks_azurerm_firewall_snat_rules

  #auzure route table creation and route configuration
  aks_route_table_name                = var.aks_route_table_name
  aks_route_table_location            = var.azure_regions_map["az1"]
  aks_route_table_resource_group_name = var.resource_group_name
  aks_azure_route_address_prefix      = var.aks_azure_route_address_prefix
  aks_azure_route_name                = var.aks_azure_route_name
  aks_azure_route_next_hop_type       = var.aks_azure_route_next_hop_type
  aks_azure_route_resource_group_name = var.resource_group_name

}
