terraform {
  required_version = "= 1.7.5"

  backend "azurerm" {
    resource_group_name  = "${local.resource_type.resource_group}-tf-${local.workspace.prod}-${local.location.north_europe.geo_code}-001"
    storage_account_name = "${local.resource_type.storage}tf${local.workspace.prod}${local.location.north_europe.geo_code}001"
    container_name       = "${local.project}-tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.89.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }

    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
