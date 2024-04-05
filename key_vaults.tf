resource "azurerm_key_vault" "ne_prjo_001" {
  name                          = "${local.resource_type.key_vault}-${local.project_name}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
  resource_group_name           = azurerm_resource_group.ne_prjo_001.name
  location                      = local.location.north_europe.name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.kv_ne_prjo_001_sku_name
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  enable_rbac_authorization     = true
  public_network_access_enabled = true
}
