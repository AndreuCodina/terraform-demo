terraform {
  required_version = "= 1.8.2"

  backend "azurerm" {
    resource_group_name  = "rg-tf-prod-ne-001"
    storage_account_name = "sttfprodne001"
    container_name       = "prjo-tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.89.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "= 2.48.0"
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
