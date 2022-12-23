terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">=3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "terraformstate901"
    container_name       = "tfstatefiles"
    key                  = "project-trafficmanager.tfstate"
  }
}



# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}