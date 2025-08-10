resource "random_string" "suffix_vm" {
  length = 4
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "PublicInstance-${random_string.suffix_vm.id}"
  resource_group_name = azurerm_resource_group.ado_group.name
  location            = azurerm_resource_group.ado_group.location
  size                = "Standard_F2"
  admin_username      = "sudhams"
  network_interface_ids = [
    azurerm_network_interface.vm_nic[0].id,
    azurerm_network_interface.vm_nic[1].id
  ]

  admin_ssh_key {
    username   = "sudhams"
    public_key = file("~/.ssh/id_rsa.pub")
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

  lifecycle {
    #create_before_destroy = true
    #ignore_changes = [ tags ]
    #prevent_destroy = true
    #replace_triggered_by = [ azurerm_subnet.ado_subnet ]
    postcondition {
      condition     = self.location == "southindia"
      error_message = "VM should be launched in \"Central India\""
    }
  }

  depends_on = [azurerm_network_interface.vm_nic]

  tags = {
    Environment = "Development"
    Type        = "webappdemo"
  }
}