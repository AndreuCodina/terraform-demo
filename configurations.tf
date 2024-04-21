resource "azurerm_key_vault" "prjo_ne_001" {
  name                          = "${local.resource_type.key_vault}-${local.project}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
  resource_group_name           = azurerm_resource_group.prjo_ne_001.name
  location                      = local.location.north_europe.name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.kv_prjo_ne_001_sku_name
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  enable_rbac_authorization     = true
  public_network_access_enabled = true
}

resource "azurerm_key_vault_secret" "prjo_ne_001" {
  name         = "SQL_SERVER__PASSWORD"
  value        = "MyPassword"
  key_vault_id = azurerm_key_vault.prjo_ne_001.id
}
