resource "azurerm_network_security_group" "example_nsg_static" {
  name                = "way2techstack-nsg"
  location            = azurerm_resource_group.ado_group.location
  resource_group_name = azurerm_resource_group.ado_group.name

  dynamic "security_rule" {
    for_each = var.ingress_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}