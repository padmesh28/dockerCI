terraform {
  backend "azurerm" {
    resource_group_name  = "mews-rg"
    storage_account_name = "mewsstorageapps"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
