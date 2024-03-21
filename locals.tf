locals {
  project = {
    projectone = "prjo"
  }

  # https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations
  resource_type = {
    resource_group      = "rg"
    key_vault           = "kv"
    sql_database_server = "sql"
  }

  # https://learn.microsoft.com/en-us/azure/backup/scripts/geo-code-list
  geo_code = {
    west_europe  = "we"
    north_europe = "ne"
  }
}
