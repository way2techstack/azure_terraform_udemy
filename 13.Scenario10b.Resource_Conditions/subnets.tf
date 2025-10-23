resource "azurerm_subnet" "public_subnets" {
  for_each                        = var.public_subnet_address
  name                            = each.key
  resource_group_name             = azurerm_resource_group.ado_group.name
  virtual_network_name            = azurerm_virtual_network.ado_network.name
  address_prefixes                = each.value
  default_outbound_access_enabled = true # Default value true

  lifecycle {
    postcondition {
      condition     = element(split("/", self.address_prefixes[0]), 1) == "24"
      error_message = "Subnets for VNet CIDR address is not matching with expected value, /24"
    }
  }
}