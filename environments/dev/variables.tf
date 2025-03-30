
variable "location" {}
variable "environment" {}
variable "resource_group_name" {}
variable "image_tag" {}
variable "acr_login_server" {}
variable "image_repository" {}
variable "vnet_address_space" {}
variable "subnet_address_prefixes" {}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for Container App Environment"
}
