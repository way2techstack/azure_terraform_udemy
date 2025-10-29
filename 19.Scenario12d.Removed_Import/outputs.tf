output "rg_ids" {
  value = {
    for k, v in azurerm_resource_group.rg_resources : k => v.id
  }
}