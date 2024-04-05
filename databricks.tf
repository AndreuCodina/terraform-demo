# resource "azurerm_databricks_workspace" "ne_prjo_001" {
#   count               = terraform.workspace == "dev" ? 1 : 0
#   name                = "${local.resource_type.databricks_workspace}-${local.project_name}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
#   resource_group_name = azurerm_resource_group.ne_prjo_001.name
#   location            = local.location.north_europe.name
#   sku                 = "standard"
# }
