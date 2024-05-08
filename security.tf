# resource "azurerm_role_assignment" "current_service_principal_with_key_vault_administrator_in_kv_prjo_ne_001" {
#   scope                = azurerm_key_vault.prjo_ne_001.id
#   role_definition_name = "Key Vault Administrator"
#   principal_id         = data.azuread_service_principal.current.object_id
# }
