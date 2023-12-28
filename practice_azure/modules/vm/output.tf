output "public_ip_address" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}


output "network_interface_id" {
    value = azurerm_network_interface.my_nic.id
  
}
