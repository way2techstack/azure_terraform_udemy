variable "location" {
  description = "Provide the location/Region under which resources to be managed"
  type        = string
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
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR which should within the VNet address"
  type        = list(string)
}

variable "rg_tags" {
  description = "Provide tags for the resource group"
  type        = map(string)
}

variable "vnet_tags" {
  description = "Provide tags for the virtual network"
  type        = map(string)
}