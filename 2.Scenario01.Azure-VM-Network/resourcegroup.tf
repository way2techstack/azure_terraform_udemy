resource "azurerm_resource_group" "ado_group" {
  name     = var.rg_name
  location = var.location

  tags = local.resource_group_tags
}