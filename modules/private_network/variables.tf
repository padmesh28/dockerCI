variable "resource_group_name" {
  type        = string
  description = "Resource group name for network resources"
}

variable "location" {
  type        = string
  description = "Azure region for network resources"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/stage/prod)"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the subnet"
}
