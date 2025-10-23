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
}

// Flat List format
/*
output "subnet_ids" {
  value = [
    for k in azurerm_subnet.public_subnets : k.id
  ]
}
*/