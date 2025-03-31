variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure region where resources will be deployed (e.g., westeurope)."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Deployment environment name (e.g., dev, stage, prod)."
}

variable "image_tag" {
  type        = string
  default     = "6e9fdd93696d0c1d5473e9700af27433888d9c52"
  description = "Docker image tag to deploy (provided dynamically from CI/CD pipeline)."
}

variable "acr_login_server" {
  type        = string
  default     = "mewsacr2025.azurecr.io"
  description = "Azure Container Registry (ACR) login server URL."
}

variable "image_repository" {
  type        = string
  default     = "sampleapp"
  description = "Repository name of the Docker image in Azure Container Registry."
}

variable "vnet_address_space" {
  type        = list(string)
  default     = ["10.1.0.0/16"]
  description = "Address space for the Azure virtual network."
}

variable "subnet_address_prefixes" {
  type        = list(string)
  default     = ["10.1.0.0/23"]
  description = "Subnet address prefixes within the Azure virtual network. Must be at least /23 for Azure Container Apps."
}

variable "mews_storage_account_name" {
  type        = string
  default     = "mewsstorageapps"
  description = "Name of the existing Azure resource group holding the shared ACR."
}

variable "pre_resourece_group"{
  type        = string
  default     = "mews-rg"
  description = "Name of the existing Azure resource group holding the shared ACR."
}

variable "acr_name" {
  type        = string
  default     = "mewsacr2025"
  description = "Name of the Azure Container Registry created during the build pipeline."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags to apply to network resources."
}
