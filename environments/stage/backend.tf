terraform {
  backend "azurerm" {
    subscription_id      = "021e9b0b-06eb-45ad-a4d0-5679f8c73085"
    resource_group_name  = "mews-rg"
    storage_account_name = "mewsstorageapps"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
