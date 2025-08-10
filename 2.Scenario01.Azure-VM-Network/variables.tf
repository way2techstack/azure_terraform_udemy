variable "location" {
  description = "Provide the location/Region under which resources to be managed"
  type        = string
  default     = "South India"
}

variable "rg_name" {
  description = "Provide a name to the resource group"
  type        = string
  default     = "ADO-Demo-Group"
}

variable "vnet_name" {
  description = "Provide name for the VNet creation"
  type        = string
  default     = "ADO-Demo-Network"
}

variable "vnet_address" {
  description = "Define CIDR value for VNet, like /16 to /26"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "ADO-Network-Subnet"
}

variable "subnet_cidr" {
  description = "Subnet CIDR which should within the VNet address"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "rg_tags" {
  description = "Provide tags for the resource group"
  type        = map(string)
  default = {
    "Name" = "ADO Team Resource Group"
  }
}

variable "vnet_tags" {
  description = "Provide tags for the virtual network"
  type        = map(string)
  default = {
    "Name" = "ADO Team Network"
  }
}