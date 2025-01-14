# resource "azurerm_mssql_server" "myproj" {
#   name                                 = "${local.resource_type.sql_database_server}-${local.project}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
#   resource_group_name                  = azurerm_resource_group.myproj.name
#   location                             = local.location.north_europe.name
#   version                              = "12.0"
#   administrator_login                  = data.azurerm_key_vault_secret.sql_server_user.value
#   administrator_login_password         = data.azurerm_key_vault_secret.sql_server_password.value
#   public_network_access_enabled        = true
#   outbound_network_restriction_enabled = false
# }
