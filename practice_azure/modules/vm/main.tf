resource "azurerm_network_interface" "my_nic" {
  name                = "mynic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = var.subnet_id #azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id        = azurerm_public_ip.public_ip.id #azurerm_public_ip.public_ip.id #azurerm_public_ip.my_terraform_public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.my_nic.id] #var.network_interface_id  #[azurerm_network_interface.my_nic.id]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
   name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  
}
resource "azurerm_public_ip" "public_ip" {
  name                = "public_ip"
  resource_group_name = var.resource_group_name
  allocation_method  = "Dynamic"
  location = var.location
}


resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.my_nic.id
  network_security_group_id = var.network_security_group_id
}

   


resource "null_resource" "store_public_ip" {
  
  # This resource has no other configuration
  # but can be used to run local-exec provisioners
  # triggers = {
  #   public_ip_id = azurerm_public_ip.my_terraform_public_ip.id
  # }

provisioner "local-exec" {
    command = <<-EOT
      echo "${azurerm_linux_virtual_machine.vm.public_ip_address}" >> public_ip.txt
    EOT
  }
  depends_on = [azurerm_linux_virtual_machine.vm]
}