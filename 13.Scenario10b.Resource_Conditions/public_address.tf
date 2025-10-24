resource "azurerm_public_ip" "vm_public_ip" {
  name                = "LinuxVMPublicIP"
  resource_group_name = azurerm_resource_group.ado_group.name
  location            = azurerm_resource_group.ado_group.location
  allocation_method   = "Static"

  tags = {
    environment = "Development"
  }

  /*
  lifecycle {
    postcondition {
      condition     = self.location == azurerm_resource_group.ado_group.location
      error_message = "Public IP address resource was not located as per resource group"
    }
  }
  */
}


data "azurerm_public_ip" "public_ip_location" {
  name                = azurerm_public_ip.vm_public_ip.name
  resource_group_name = azurerm_resource_group.ado_group.name

  lifecycle {
    postcondition {
      condition     = self.location == azurerm_resource_group.ado_group.location
      error_message = "Public IP address resource was not located as per resource group"
    }
  }
}