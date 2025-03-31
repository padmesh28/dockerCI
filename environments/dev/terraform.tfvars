location                 = "westeurope"
environment              = "dev"
resource_group_name      = "mews-dev-rg"
mews_resource_group_name = "mews-rg"
acr_name                 = "mewsacr2025"
vnet_address_space       = ["10.1.0.0/16"]
subnet_address_prefixes  = ["10.1.0.0/23"]
image_tag                = "6e9fdd93696d0c1d5473e9700af27433888d9c52"  #Added just placeholder actual values will come from pipeline
acr_login_server         = "mewsacr2025.azurecr.io"
image_repository         = "sampleapp"

