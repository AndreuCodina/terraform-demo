resource "azurerm_resource_group" "projectone_001" {
  name     = "${local.resource_type.resource_group}-${local.project.projectone}-${terraform.workspace}-001"
  location = "westeurope"
}

resource "azurerm_key_vault" "projectone_001" {
  name                          = "${local.resource_type.key_vault}-${local.project.projectone}-${terraform.workspace}-${local.geo_code.west_europe}-001"
  location                      = azurerm_resource_group.projectone_001.location
  resource_group_name           = azurerm_resource_group.projectone_001.name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = "standard"
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  enable_rbac_authorization     = true
  public_network_access_enabled = true
}

resource "azurerm_mssql_server" "projectone_001" {
  name                                 = "${locals.sql_database_server}-${locals.project.projectone}-${terraform.workspace}-${locals.geo_code.west_europe}-001"
  resource_group_name                  = azurerm_resource_group.projectone_001.name
  location                             = azurerm_resource_group.projectone_001.location
  version                              = "12.0"
  administrator_login                  = var.projectone__sql_database_server__user
  administrator_login_password         = var.projectone__sql_database_server__password
  public_network_access_enabled        = true
  outbound_network_restriction_enabled = false
}
