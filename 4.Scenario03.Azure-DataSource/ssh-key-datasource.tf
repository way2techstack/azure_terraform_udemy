data "azurerm_ssh_public_key" "ssh_key" {
  name                = "demokey"
  resource_group_name = "compute" #azurerm_resource_group.ado_group.name
}