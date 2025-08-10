resource "azurerm_network_interface" "vm_nic" {
  count               = 2
  name                = "linux_vm_nic-${count.index}-${random_string.suffix_vm.id}"
  location            = azurerm_resource_group.ado_group.location
  resource_group_name = azurerm_resource_group.ado_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ado_subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }

  #depends_on = [ azurerm_public_ip.vm_public_ip ]
}