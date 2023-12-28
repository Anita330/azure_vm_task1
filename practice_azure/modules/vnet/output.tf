output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = azurerm_virtual_network.vnet.name
}


output "vnet_id" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet.id
  
}
output "subnet_id" {

  value = azurerm_subnet.subnet.id
}