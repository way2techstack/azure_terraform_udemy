data "azurerm_client_config" "current" {}

// Resource group creation using for_each
resource "azurerm_resource_group" "rg_resources" {
  for_each = lookup(var.rg_names, var.environment, {})
  name     = each.key
  location = each.value.location

  tags = each.value.tags
}

/*
removed {
  from = azurerm_resource_group.resource_group
  lifecycle {
   destroy = false
  }
}
*/

/*
import {
  for_each = lookup(var.rg_names, var.environment, {})
  id       = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${each.key}"
  to       = azurerm_resource_group.resource_group[each.key]
}
*/

moved {
  from = azurerm_resource_group.resource_group
  to   = azurerm_resource_group.rg_resources
}