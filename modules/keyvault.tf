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
