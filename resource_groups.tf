# resource "azurerm_resource_group" "prjo_ne_001" {
#   name     = "${local.resource_type.resource_group}-${local.project_name}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
#   location = local.location.north_europe.name
# }
