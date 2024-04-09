locals {
  project_name = "prjo"

  # https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations
  resource_type = {
    resource_group       = "rg"
    key_vault            = "kv"
    sql_database_server  = "sql"
    databricks_workspace = "dbw"
  }

  # name: az account list-locations -o table
  # geo_code: https://learn.microsoft.com/en-us/azure/backup/scripts/geo-code-list
  location = {
    west_europe = {
      name     = "westeurope"
      geo_code = "we"
    }

    north_europe = {
      name     = "northeurope"
      geo_code = "ne"
    }
  }
}
