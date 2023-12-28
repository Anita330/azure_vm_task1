resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# resource "azurerm_ssh_public_key" "ssh_public_key" {
#   name                = "ssh-public-key"
#   resource_group_name = "rg"
# }

# terraform import azurerm_ssh_public_key.ssh_public_key /subscriptions/42586c24-ddce-4fa1-8c13-82c36f97c4ce/resourceGroups/RG/providers/Microsoft.Compute/sshPublicKeys/ssh_public_keyter