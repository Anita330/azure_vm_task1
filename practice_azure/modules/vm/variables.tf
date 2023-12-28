variable "vm_name" {
  description = "Name of the virtual machine"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region where the resources will be created"
}

variable "vm_size" {
  description = "Size of the virtual machine"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
}


variable "admin_password" {
  description = "Admin password for the virtual machine"
}

variable "image_publisher" {
  description = "Publisher of the OS image"
}

variable "image_offer" {
  description = "Offer of the OS image"
}

variable "image_sku" {
  description = "SKU of the OS image"
}

variable "image_version" {
  description = "Version of the OS image"
}

variable "subnet_id" {}

variable "network_security_group_id" {}