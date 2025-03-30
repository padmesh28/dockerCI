provider "azurerm" {
  features {}
  subscription_id = "021e9b0b-06eb-45ad-a4d0-5679f8c73085"
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
}
