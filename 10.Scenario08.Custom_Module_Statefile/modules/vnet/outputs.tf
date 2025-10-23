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
  value = azurerm_subnet.ado_subnet.id
}

output "nic_ids" {
  value = azurerm_network_interface.vm_nic.*.id
}