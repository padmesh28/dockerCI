locals {
  resource_group_name = "mews-${var.environment}-rg"
  
  common_tags = {
    Environment = "${var.environment}"
    ManagedBy   = "Terraform"
    Project     = "AzureContainerApps"
    Department  = "Mews"
  }
}
