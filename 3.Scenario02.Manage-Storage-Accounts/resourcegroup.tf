resource "azurerm_resource_group" "ado_rg_groups" {
  for_each = var.resource_group_names
  name     = each.key
  location = each.value # Or a dynamic location from a map
  tags = {
    Environment = each.key
  }
}