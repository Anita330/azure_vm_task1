# # # modules/vnet/variables.tf

variable "resource_group_name" {
  description = "Name of the resource group"
  type = string
}

variable "vnet_name" {
  type = string 
  description = "vnet variables name "
  
}

variable "location" {
  type = string
  description = "Azure region where the resources will be created"
}

# # variable "virtual_network_name" {
# #   description = "Name of the virtual network"
# # }

variable "vnet_address_space" {
  type = string
  description = "Address space of the virtual network"
}

variable "subnet_name" {
  type               = string
  description        = "Subnet Name of Virtual Network"
}
variable "subnet_address_prefixes" {
  type               = string
  description        = "Address prefixes of Subnet"
}
