# resource "azurerm_key_vault" "myproj" {
#   name                          = "${local.resource_type.key_vault}-${local.project}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
#   resource_group_name           = azurerm_resource_group.myproj.name
#   location                      = local.location.north_europe.name
#   tenant_id                     = data.azuread_client_config.current.tenant_id
#   sku_name                      = local.configuration.kv_myproj_sku_name
#   soft_delete_retention_days    = 30
#   purge_protection_enabled      = false
#   enable_rbac_authorization     = true
#   public_network_access_enabled = true
# }

# data "azurerm_key_vault_secret" "sql_server_user" {
#   name         = "SqlServer--User"
#   key_vault_id = azurerm_key_vault.myproj.id
# }

# data "azurerm_key_vault_secret" "sql_server_password" {
#   name         = "SqlServer--Password"
#   key_vault_id = azurerm_key_vault.myproj.id
# }
