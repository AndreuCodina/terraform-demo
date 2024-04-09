# resource "azurerm_mssql_server" "prjo_ne_001" {
#   name                                 = "${local.resource_type.sql_database_server}-${local.project_name}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
#   resource_group_name                  = azurerm_resource_group.ne_prjo_001.name
#   location                             = local.location.north_europe.name
#   version                              = "12.0"
#   administrator_login                  = var.sql_prjo_ne_001_login
#   administrator_login_password         = var.sql_prjo_ne_001_password
#   public_network_access_enabled        = true
#   outbound_network_restriction_enabled = false
# }
