variable "location" {
  description = "Provide the location/Region under which resources to be managed"
  type        = string
  default     = "East US"
  validation {
    condition     = var.location == "East US" # Logical Operator
    error_message = "Resource should be launched only in East US region"
  }
}

variable "rg_name" {
  description = "Provide a name to the resource group"
  type        = string
  default     = "way2techstackgroup"
}

variable "mysql_vault_name" {
  description = "Provide name for mysql key-vault resource"
  type        = string
  default     = "way2techstackcredentials"
}

// Temp Password = FxzXOcNSr6GHeVfh