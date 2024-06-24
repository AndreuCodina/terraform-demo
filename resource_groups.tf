resource "azurerm_resource_group" "myproj_001" {
  name     = "${local.resource_type.resource_group}-${local.project}-${terraform.workspace}-${local.location.north_europe.geo_code}-001"
  location = local.location.north_europe.name
}
