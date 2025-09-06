output "rg_id" {
  value = azurerm_resource_group.ado_group.id
}

output "vnet_id" {
  value = azurerm_virtual_network.ado_network.id
}

output "subnet_id" {
  value = azurerm_subnet.ado_subnet.id
}