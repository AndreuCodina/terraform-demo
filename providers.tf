terraform {
  required_version = "= 1.8.5"

  backend "azurerm" {
    resource_group_name  = "rg-terraform-pro-ne-001"
    storage_account_name = "stterraformprone001"
    container_name       = "myproj-tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.109.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "= 2.52.0"
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
