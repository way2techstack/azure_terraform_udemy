resource "azurerm_storage_account" "storage_accounts" {
  for_each = {
    for k, v in var.storage_accounts : k => v if k == terraform.workspace
  }
  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.azure_resource_group[each.key].name # Assuming a resource group exists
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}