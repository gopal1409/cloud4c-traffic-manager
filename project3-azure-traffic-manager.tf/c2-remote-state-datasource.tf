#remote state for project 1
data "terraform_remote_state" "project1_eastus" {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "terraformstate901"
    container_name       = "tfstatefiles"
    key                  = "project1-eastus-terraform.tfstate"
  }
}

data "terraform_remote_state" "project2_eastus" {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "terraformstate901"
    container_name       = "tfstatefiles"
    key                  = "project2-eastus2-terraform.tfstate"
  }
}