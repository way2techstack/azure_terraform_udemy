output "rg_name" {
  value = azurerm_resource_group.ado_group.name
}

output "rg_location" {
  value = azurerm_resource_group.ado_group.location
}

output "vnet_id" {
  value = azurerm_virtual_network.ado_network.id
}

output "subnet_id" {
  value = azurerm_subnet.ado_subnet.id
}

output "public_key" {
  value     = data.azurerm_ssh_public_key.ssh_key.public_key
  sensitive = true
}