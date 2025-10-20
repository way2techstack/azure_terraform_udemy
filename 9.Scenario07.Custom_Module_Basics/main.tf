module "vnet" {
  source = "./modules/vnet"

  # Values for VNet
  location     = "West US"
  rg_name      = "Way2TechStackGroup"
  vnet_name    = "TechStackNetwork"
  vnet_address = ["10.20.0.0/16"]
  subnet_name  = "PublicSubnet"
  subnet_cidr  = ["10.20.0.0/24"]
  rg_tags = {
    Name        = "Way2TechStackGroup"
    Environment = "Development"
  }
  vnet_tags = {
    Name        = "TechStackNetwork"
    Environment = "Development"
  }
}

module "instance" {
  source = "./modules/instance"

  # Values for Virtual Machine
  nic_ids  = module.vnet.nic_ids
  location = module.vnet.rg_location
  rg_name  = module.vnet.rg_name
  vm_tags = {
    Name        = "PublicInstance"
    Environment = "Development"
  }

  depends_on = [module.vnet]
}