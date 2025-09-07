resource "azurerm_public_ip" "vm_public_ip" {
  name                = "LinuxVMPublicIPDemo"
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  location            = data.terraform_remote_state.network.outputs.rg_location
  allocation_method   = "Static"

  tags = {
    environment = "Development"
  }
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "linux_vm_nic_demo"
  location            = data.terraform_remote_state.network.outputs.rg_location
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.network.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }

  depends_on = [azurerm_public_ip.vm_public_ip]
}