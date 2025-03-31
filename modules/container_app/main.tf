resource "azurerm_user_assigned_identity" "acr_pull_identity" {
  name                = "${var.environment}-acr-identity"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_role_assignment" "acr_pull_role" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.acr_pull_identity.principal_id
}

resource "azurerm_log_analytics_workspace" "log" {
  name                = "${var.environment}-log"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "container_app_env" {
  name                       = "${var.environment}-env"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id
  infrastructure_subnet_id   = var.subnet_id


  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}

resource "azurerm_container_app" "app" {
  name                         = "${var.environment}-app"
  container_app_environment_id = azurerm_container_app_environment.container_app_env.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.acr_pull_identity.id]
  }

  registry {
    identity = azurerm_user_assigned_identity.acr_pull_identity.id
    server   = var.acr_login_server
  }

  template {
    container {
      name   = var.environment
      image  = "${var.acr_login_server}/${var.image_repository}:${var.image_tag}"
      cpu    = 0.5
      memory = "1.0Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 3000
    transport        = "auto"

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

}
