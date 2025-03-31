variable "location" {
  type        = string
  description = "Azure region where resources will be deployed (e.g., westeurope)."
}

variable "environment" {
  type        = string
  description = "Deployment environment name"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group to create and manage resources."
}

variable "image_tag" {
  type        = string
  description = "Docker image tag to deploy."
}

variable "acr_login_server" {
  type        = string
  description = "Azure Container Registry (ACR) login server URL."
}

variable "image_repository" {
  type        = string
  description = "Repository name of the Docker image in Azure Container Registry."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Azure virtual network."
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for subnets within the Azure virtual network."
}

variable "mews_resource_group_name" {
    type        = string
  description = "Name of the mews Azure resource group for acr tf state files."
}

variable "acr_name" {
    type        = string
  description = "Precreated  acr name in build pipeline ."
}
