// Resource group creation using count
resource "azurerm_resource_group" "resource_group" {
  count    = length(var.rg_names)  # 4
  name     = var.rg_names[count.index]
  location = "East US" # Region name
}

// Resource group creation using for_each
/*
resource "azurerm_resource_group" "resource_group" {
  for_each = toset(var.rg_names)
  name     = each.key  # each.value
  location = "East US" # Region name
}
*/