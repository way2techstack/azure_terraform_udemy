output "rg_location" {
  value = azurerm_resource_group.ado_group.location
}

output "rg_name" {
  value = azurerm_resource_group.ado_group.name
}

output "vnet_id" {
  value = azurerm_virtual_network.ado_network.id
}

output "subnet_id" {
  value = {
    for k, v in azurerm_subnet.public_subnets : k => v.id
  }
  precondition {
    condition     = alltrue([for s in azurerm_subnet.public_subnets : s.default_outbound_access_enabled])
    error_message = "Ensure subnets are enabled to allow outbound traffic"
  }
}


# TODO: Ensure only 3 Inbound rules gets created for NSG
/*
output "nsg_allowed_ports_check" {
  description = "Check if NSG allows inbound access on ports 22, 80, and 443"

  # Extract matching inbound allow rules for ports 22, 80, 443
  value = [
    for rule in azurerm_network_security_group.nsg_static.security_rule :
    {
      name        = rule.name
      port        = rule.destination_port_range
      access      = rule.access
      direction   = rule.direction
      description = rule.description
    }
    if(
      rule.direction == "Inbound" &&
      rule.access == "Allow" &&
      contains(["22", "80", "443"], rule.destination_port_range)
    )
  ]

  # Ensure exactly 3 rules match (22, 80, 443)
  precondition {
    condition = length([
      for rule in azurerm_network_security_group.nsg_static.security_rule :
      rule if(
        rule.direction == "Inbound" &&
        rule.access == "Allow" &&
        contains(["22", "80", "443"], rule.destination_port_range)
      )
    ]) == 3
    error_message = "NSG must have exactly 3 inbound allow rules for ports 22, 80, and 443."
  }
}
*/

// Flat List format
/*
output "subnet_ids" {
  value = [
    for k in azurerm_subnet.public_subnets : k.id
  ]
}
*/