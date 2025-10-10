resource "azurerm_resource_group" "azure_resource_group" {
  for_each = {
    for k, v in var.storage_accounts : k => v if k == terraform.workspace
  }
  name     = each.value.name
  location = each.value.location # Or a dynamic location from a map
}