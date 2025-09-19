resource "azurerm_storage_account" "storage_accounts" {
  for_each                 = var.storage_accounts
  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.ado_rg_groups[each.key].name # Assuming a resource group exists
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  tags = local.storage_tags[each.key]
}