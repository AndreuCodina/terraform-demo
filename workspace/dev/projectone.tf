resource "azurerm_key_vault" "projectone_002" {
  name                          = "kv-projectone-dev-we-002"
  location                      = azurerm_resource_group.projectone_001.location
  resource_group_name           = azurerm_resource_group.projectone_001.name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = "standard"
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  enable_rbac_authorization     = true
  public_network_access_enabled = true
}
