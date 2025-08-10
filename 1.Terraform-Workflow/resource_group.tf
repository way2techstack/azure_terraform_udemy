// Resource group creation
resource "azurerm_resource_group" "build_group01" {
  name     = "ADO_Build"   # Name of the group
  location = "South India" # Region name
}