terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#backend
terraform {
  backend "azurerm" {
    resource_group_name  = "ba-mgmt"
    storage_account_name = "buildingterraformstate"
    container_name       = "terraformstate"
    key                  = "terraform-on-azure.tfstate"
  }
}

resource "random_pet" "rg-name" {
  prefix    = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name      = random_pet.rg-name.id
  location  = var.resource_group_location
}

