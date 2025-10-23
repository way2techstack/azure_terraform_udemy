variable "location" {
  description = "Provide the location/Region under which resources to be managed"
  type        = string
}

variable "rg_name" {
  description = "Provide a name to the resource group"
  type        = string
}

variable "vm_tags" {
  description = "Provide tags for the virtual machine"
  type        = map(string)
}