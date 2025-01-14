# resource "azurerm_databricks_workspace" "myproj" {
#   count               = terraform.workspace == local.workspace.dev ? 1 : 0
#   name                = "${local.resource_type.databricks_workspace}-${local.project}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
#   resource_group_name = azurerm_resource_group.myproj.name
#   location            = local.location.north_europe.name
#   sku                 = "standard"
# }
