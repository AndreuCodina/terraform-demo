resource "azurerm_resource_group" "ne_prjo_001" {
  name     = "${local.resource_type.resource_group}-${local.project_name}-${terraform.workspace}-001"
  location = local.location.north_europe.name
}
