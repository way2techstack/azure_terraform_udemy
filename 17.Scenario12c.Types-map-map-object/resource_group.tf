// Resource group creation using for_each
resource "azurerm_resource_group" "resource_group" {
  for_each = lookup(var.rg_names, var.environment, {})
  name     = each.key
  location = each.value.location

  tags = each.value.tags
}