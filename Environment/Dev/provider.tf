terraform {

  required_providers {

    azurerm = {

      source  = "hashicorp/azurerm"
      version = "4.67.0"

    }


  }

  backend "azurerm" {

    resource_group_name  = "backend-rg"
    storage_account_name = "insidersstorageaccount"
    container_name       = "insidercontainer"
    key                  = "npo.tfstate"

  }

}
provider "azurerm" {

  features {}
  subscription_id = "ae541482-2a9e-4a6d-a4f0-1618f02c5bbf"

}
