###############################################################################
# HCF Blueprint-specific Variables
###############################################################################
variable "resource_group_name"{
  type     = string
  default  = ""
}

variable "app_ref" {
  type    = string
  default = ""
}

variable "buAdCode" {
  type    = string
  default = ""
}

variable "subsCode" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}


variable "azure_regions_map" {
  type = map(any)

  default = {
    az1 = "southeast asia"
    az2 = "east asia"
  }
}

variable "regions" {
  type = list(any)

  default = [
    "az1",
    "az2",
  ]
}

variable "resource_tags" {
  type = map(any)

  default = {
    tag_business_unit = "contour"
    tag_env           = "prd"
    tag_app_name      = "firewall"
    tag_app_owner     = "luke@contour.network"
  }
}

variable "tags" {
  type = map(any)

  default = {
    BusinessUnit     = "contour-sg"
    Environment      = "prd"
    SubscriptionCode = "prd"
    ApplicationCode  = "corda"
    ApplicationName  = "firewall"
    ApplicationOwner = "luke@contour.network"
  }
}

variable "location_map" {
  type = map(any)

  default = {
    "region1" = "southeast asia"
    "region2" = "east asia"
  }
}

variable "aks_azure_firewall_public_ip_name"{
  type = string
}

variable "aks_azure_firewall_public_ip_name_2"{
  type = string
}

variable "aks_azure_firewall_public_ip_name_3"{
  type = string
}
variable "aks_azure_firewall_allocation_method" {
  type = string
}

variable "aks_azure_firewall_sku" {
  type = string
}

variable "aks_azure_firewall_name" {
  type = string
}

variable "aks_azure_firewall_ip_configuration_name" {
  type = string
}

variable "aks_azure_firewall_ip_configuration_name_2" {
  type = string
}

variable "aks_azure_firewall_ip_configuration_name_3" {
  type = string
}
variable "aks_azurerm_firewall_dnat_rules" {
  description = "List of nat rules to apply to firewall."
  type        = list(object({ name = string, action = string, source_addresses = list(string), destination_ports = list(string), destination_addresses = list(string), protocols = list(string), translated_address = string, translated_port = string }))
  default     = []
}

variable "aks_azurerm_firewall_snat_rules" {
  description = "List of network rules to apply to firewall."
  type        = list(object({ name = string, action = string, source_addresses = list(string), destination_ports = list(string), destination_addresses = list(string), protocols = list(string) }))
  default     = []
}

##Vnet Variables

variable "vnet_ddos_enable" {
  type  = bool
}

variable "vnet_name" {
  type  = string
}



#variable "vnet_network_mananger_name" {
#  type = string
#}

variable "ddos_plan_name" {
  type  = string
}

variable "vnet_ddos_id" {
  type = string
}

#route table var's

variable "aks_route_table_name" {
  type  = string
}

variable "aks_azure_route_address_prefix" {
  type  = string
}

variable "aks_azure_route_name" {
  type = string
}

variable "aks_azure_route_next_hop_type" {
  type= string
}
