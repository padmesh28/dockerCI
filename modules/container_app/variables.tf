variable "location" {
  type        = string
  description = "The Azure region to deploy resources in."
}

variable "environment" {
  type        = string
  description = "Name of the deployment environment."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to deploy resources into."
}

variable "image_tag" {
  type        = string
  description = "Docker image tag for the application container."
}

variable "acr_login_server" {
  type        = string
  description = "Azure Container Registry (ACR) login server URL."
}

variable "image_repository" {
  type        = string
  description = "Docker image repository name in the Azure Container Registry."
}

variable "acr_id" {
  type        = string
  description = "The resource ID of the Azure Container Registry."
}

variable "subnet_id" {
  type        = string
  description = "The resource ID of the subnet used for the Container App environment."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags to apply to Container App resources."
}
