resource "azurerm_virtual_network" "ado_network" {
  name                = var.vnet_name
  location            = azurerm_resource_group.ado_group.location
  resource_group_name = azurerm_resource_group.ado_group.name
  address_space       = var.vnet_address

  tags = local.vnet_tags
}