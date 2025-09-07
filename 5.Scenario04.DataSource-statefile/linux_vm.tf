resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "PublicInstance-Demo"
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  location            = data.terraform_remote_state.network.outputs.rg_location
  size                = "Standard_F2"
  admin_username      = "sudhams"
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  admin_ssh_key {
    username   = "sudhams"
    public_key = data.terraform_remote_state.network.outputs.public_key
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
    "Name"      = "DemoInstance"
    Environment = "Development"
    Type        = "webappdemo"
  }

  depends_on = [azurerm_network_interface.vm_nic]
}