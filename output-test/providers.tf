terraform {
  backend "azurerm" {
    resource_group_name  = "RG1"
    storage_account_name = "testingreposa1"
    container_name       = "tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }
}

provider "azurerm" {
  features {}
}
