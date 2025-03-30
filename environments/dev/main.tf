provider "azurerm" {
  features {}
}

data "azurerm_container_registry" "acr" {
  name                = "mewsacr2025"
  resource_group_name = "mews-rg"
}

module "container_app" {
  source              = "../../modules/container_app"
  location            = var.location
  environment         = var.environment
  resource_group_name = var.resource_group_name
  acr_id              = data.azurerm_container_registry.acr.id
  image_tag           = var.image_tag
  acr_login_server    = var.acr_login_server
  image_repository    = var.image_repository
  subnet_id           = module.private_network.subnet_id 

}

module "private_network" {
  source                  = "../../modules/private_network"
  resource_group_name     = var.resource_group_name
  location                = var.location
  environment             = var.environment
  vnet_address_space      = ["10.1.0.0/16"]
  subnet_address_prefixes = ["10.1.1.0/24"]
}


