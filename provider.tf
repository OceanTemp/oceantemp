terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  key_vault {
    purge_soft_delete_on_destroy    = true
    recover_soft_deleted_key_vaults = true
  }
}