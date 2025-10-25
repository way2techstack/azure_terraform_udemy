output "rg_ids" {
  value = [for k in azurerm_resource_group.resource_group : k.id]
}

/*
output "rg_ids" {
  value = {
    for k, v in azurerm_resource_group.resource_group : k => v.id
  }
}
*/