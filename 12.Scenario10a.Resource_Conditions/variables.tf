variable "location" {
  description = "Provide the location/Region under which resources to be managed"
  type        = string
  validation {
    condition     = var.location == "East US" # Logical Operator
    error_message = "Resource should be launched only in East US region"
  }
}

variable "rg_name" {
  description = "Provide a name to the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Provide name for the VNet creation"
  type        = string
}

variable "vnet_address" {
  description = "Define CIDR value for VNet, like /16 to /26"
  type        = list(string)
  validation {
    condition     = startswith(var.vnet_address[0], "10.") && split("/", var.vnet_address[0])[1] == "16"
    error_message = "Provided CIDR should be Class-A private network and with /16 subnetmask"
  }
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR which should within the VNet address"
  type        = list(string)
}

variable "ingress_rules" {
  description = "Ingress rules for Network Security Group"
  type        = list(map(any))
  default = [
    {
      name                       = "AllowSSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowHTTP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowHTTPS"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    }
  ]
}

variable "rg_tags" {
  description = "Provide tags for the resource group"
  type        = map(string)
}

variable "vnet_tags" {
  description = "Provide tags for the virtual network"
  type        = map(string)
}