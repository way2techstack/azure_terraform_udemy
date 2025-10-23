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
  /*
  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTPS"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  */
}

# TODO: New approach to create Network Security Group and 
# Security Rules with individual resource block as provided below.
/*
resource "azurerm_network_security_group" "nsg" {
  name                = "way2techstack-nsg"
  location            = azurerm_resource_group.ado_group.location
  resource_group_name = azurerm_resource_group.ado_group.name
}

resource "azurerm_network_security_rule" "dynamic_rules" {
  for_each                    = { for rule in var.ingress_rules : rule.name => rule }
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.ado_group.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
*/