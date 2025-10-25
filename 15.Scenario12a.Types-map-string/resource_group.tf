// Resource group creation using for_each
resource "azurerm_resource_group" "resource_group" {
  for_each = var.rg_names
  name     = each.key
  location = each.value
}