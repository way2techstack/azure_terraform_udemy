resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "PublicInstance"
  resource_group_name = azurerm_resource_group.ado_group.name
  location            = azurerm_resource_group.ado_group.location
  size                = "Standard_F2"
  admin_username      = "sudhams"
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  admin_ssh_key {
    username   = "sudhams"
    public_key = data.azurerm_ssh_public_key.ssh_key.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    Environment = "Development"
    Type        = "webappdemo"
  }

  depends_on = [azurerm_network_interface.vm_nic, data.azurerm_ssh_public_key.ssh_key]
}