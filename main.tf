data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "projectone_001" {
  name     = "${local.resource_type.resource_group}-${local.project_name}-${terraform.workspace}-001"
  location = local.location.north_europe.name
}

resource "azurerm_key_vault" "projectone_001" {
  name                          = "${local.resource_type.key_vault}-${local.project_name}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
  resource_group_name           = azurerm_resource_group.projectone_001.name
  location                      = azurerm_resource_group.projectone_001.location
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.kv_projectone_001_sku_name
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  enable_rbac_authorization     = true
  public_network_access_enabled = true
}

# resource "azurerm_mssql_server" "projectone_001" {
#   name                                 = "${local.resource_type.sql_database_server}-${local.project_name}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
#   resource_group_name                  = azurerm_resource_group.projectone_001.name
#   location                             = azurerm_resource_group.projectone_001.location
#   version                              = "12.0"
#   administrator_login                  = var.sql_projectone_001_login
#   administrator_login_password         = var.sql_projectone_001_password
#   public_network_access_enabled        = true
#   outbound_network_restriction_enabled = false
# }

# resource "azurerm_databricks_workspace" "projectone_001" {
#   count               = terraform.workspace == "dev" ? 1 : 0
#   name                = "${local.resource_type.databricks_workspace}-${local.project_name}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
#   resource_group_name = azurerm_resource_group.projectone_001.name
#   location            = azurerm_resource_group.projectone_001.location
#   sku                 = "standard"
# }
