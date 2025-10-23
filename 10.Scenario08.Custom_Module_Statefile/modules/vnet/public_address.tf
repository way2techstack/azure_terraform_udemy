resource "azurerm_public_ip" "vm_public_ip" {
  name                = "LinuxVMPublicIP"
  resource_group_name = azurerm_resource_group.ado_group.name
  location            = azurerm_resource_group.ado_group.location
  allocation_method   = "Static"

  tags = {
    environment = "Development"
  }
}