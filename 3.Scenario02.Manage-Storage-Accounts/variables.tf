variable "location" {
  description = "Provide the location/Region under which resources to be managed"
  type        = string
  default     = "East US"
}

variable "resource_group_names" {
  description = "A list of resource group names to create."
  type        = map(string)
  default = {
    "webapp-dev"      = "West US"
    "containers-dev"  = "West US"
    "webapp-prod"     = "East US"
    "containers-prod" = "East US"
  }
}

variable "storage_accounts" {
  description = "A map of storage account configurations."
  type = map(object({
    location               = string
    account_tier           = string
    account_replication_type = string
  }))
  default = {
    "storagewebprod" = {
      location                 = "West US"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    },
    "storagewebdev" = {
      location                 = "East US"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
}

/*
variable "resource_group_names" {
  description = "A list of resource group names to create."
  type        = list(string)
  default     = ["webapp-dev", "containers-dev", "webapp-prod", "container-prod"]
}
*/