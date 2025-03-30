location                = "westeurope"
environment             = "dev"
resource_group_name    = "mews-dev-rg"
vnet_address_space      = ["10.1.0.0/16"]
subnet_address_prefixes = ["10.1.1.0/24"]

# image_tag           = "c428706570b64072b4a17995fc1d8c8b371f761a"
# acr_login_server    = "docker.io"
# image_repository    = "padmesh28/mews"

image_tag            = "e6d1847f8d43a4888894cac0feb87f99eddc9"
acr_login_server     = "mewsacr2025.azurecr.io"
image_repository     = "sampleapp"

