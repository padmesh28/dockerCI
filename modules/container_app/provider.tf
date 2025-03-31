terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.25.0"  
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "021e9b0b-06eb-45ad-a4d0-5679f8c73085"
}
