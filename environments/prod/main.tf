provider "azurerm" {
  features {}
}

data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.pre_resourece_group
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
}

module "private_network" {
  source                  = "../../modules/private_network"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  environment             = var.environment
  vnet_address_space      = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
  tags                    = local.common_tags
}

module "container_app" {
  source              = "../../modules/container_app"
  location            = azurerm_resource_group.rg.location
  environment         = var.environment
  resource_group_name = azurerm_resource_group.rg.name
  acr_id              = data.azurerm_container_registry.acr.id
  image_tag           = var.image_tag
  acr_login_server    = var.acr_login_server
  image_repository    = var.image_repository
  subnet_id           = module.private_network.subnet_id  
  tags                = local.common_tags
}
