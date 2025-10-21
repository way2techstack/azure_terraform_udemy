output "vm_public_ip" {
  description = "Linux Virtual Machine Public IP address"
  value       = azurerm_linux_virtual_machine.linux_vm.public_ip_addresses
}