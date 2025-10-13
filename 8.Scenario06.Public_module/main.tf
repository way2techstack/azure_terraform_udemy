module "vnet" {
  source  = "Azure/vnet/azurerm" # registry.terraform.io
  version = "5.0.1"

  // Insert variables for VNet, Subnets, etc.,
  vnet_name           = "UdemyDemoVNet"
  resource_group_name = "UdemoDemoGroup"
  vnet_location       = "East US"
  address_space       = ["10.100.0.0/16"]
  subnet_names        = ["publicsubnet01", "publicsubnet02", "privatesubnet01", "privatesubnet02"]
  subnet_prefixes     = ["10.100.0.0/24", "10.100.2.0/24", "10.100.1.0/24", "10.100.3.0/24"]

  tags = {
    "Environment" = "Development"
    "Owner"       = "Way2TechStack"
  }
}