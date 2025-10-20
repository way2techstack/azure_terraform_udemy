resource "random_string" "suffix_vm" {
  length  = 16
  lower   = true
  special = false
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                  = "PublicInstance-${random_string.suffix_vm.id}"
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = "Standard_F2"
  admin_username        = "sudhams"
  network_interface_ids = var.nic_ids

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

  tags = var.vm_tags
}