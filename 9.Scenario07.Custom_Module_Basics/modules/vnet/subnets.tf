resource "azurerm_subnet" "ado_subnet" {
  name                            = var.subnet_name
  resource_group_name             = azurerm_resource_group.ado_group.name
  virtual_network_name            = azurerm_virtual_network.ado_network.name
  address_prefixes                = var.subnet_cidr
  default_outbound_access_enabled = true # Default value true
}