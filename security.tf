resource "azurerm_role_assignment" "current_identity_with_key_vault_administrator" {
  scope                = azurerm_key_vault.prjo_ne_001.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.principal_id
}
