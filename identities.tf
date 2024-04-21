data "azuread_client_config" "current" {}


data "azuread_service_principal" "current" {
  object_id = data.azuread_client_config.current.object_id
}
