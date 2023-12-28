module "rg_module" {
    source                = "./modules/rg"
    resource_group_name   = "rg"
    location              = "West Europe"
  
}

module "blob" {
  source                  = "./modules/blob"
  location                = module.rg_module.location
  resource_group_name     = module.rg_module.resource_group_name
  account_tier            = "Standard"
  
}
module "vnet" {
  source                  = "./modules/vnet"
  resource_group_name     = module.rg_module.resource_group_name
  location                = module.rg_module.location
  vnet_name               = "new-vnet"
  vnet_address_space      = "10.0.0.0/16"
  subnet_name             = "subnet01"
  subnet_address_prefixes =  "10.0.0.0/24"
  depends_on              = [module.rg_module]
}
module "security" {
  source                  = "./modules/security"
  resource_group_name     = module.rg_module.resource_group_name
  location                = module.rg_module.location
  security_group_name =  "mysecurity"
   depends_on           = [ module.vnet ]
}




 module "myvm" {
  source              = "./modules/vm"
  vm_name             = "myvm"
  resource_group_name = module.rg_module.resource_group_name
  location            = module.rg_module.location
  vm_size             = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password      = "Passwd12345#"
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "16.04-LTS"
  image_version       = "latest"
  subnet_id            = module.vnet.subnet_id
  network_security_group_id = module.security.network_security_group_id
  
 }


