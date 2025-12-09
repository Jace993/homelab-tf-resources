terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.55.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
  subscription_id = "3287ff29-c665-46b1-ae93-fda6542f4951"
}

resource "azurerm_resource_group" "rg-keyvault" {
  name     = "rg-keyvault"
  location = "West Europe"
}

module "avm-res-keyvault-vault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.2"
  # insert the 4 required variables here
  resource_group_name = azurerm_resource_group.rg-keyvault.name
  tenant_id           = "f69eeab6-2ac0-4e49-b996-b054c096e4d2"
  name                = "keyvault01"
  location            = azurerm_resource_group.rg-keyvault.location
}
