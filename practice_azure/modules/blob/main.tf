resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group_name = var.resource_group_name
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "my_storage_account" {
  name                     = "diag${random_id.random_id.hex}"
  location                 = var.location #azurerm_resource_group.rg.location
  resource_group_name      = var.resource_group_name            #azurerm_resource_group.rg.name
  account_tier             = var.account_tier #"Standard"
  account_replication_type =  "LRS"
}

resource "azurerm_storage_container" "my_container" {
  name                  = "mycontainer"  # Change this to your desired container name
  storage_account_name  = azurerm_storage_account.my_storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "mystorage" {
  name                   = "public_ip.txt"  # Change this to your desired blob (file) name
  storage_account_name   = azurerm_storage_account.my_storage_account.name
  storage_container_name = azurerm_storage_container.my_container.name
  type                   = "Block"
  source                 = "/home/einfochips/practice_azure/public_ip.txt"  # Change this to the local path of your .txt file
}