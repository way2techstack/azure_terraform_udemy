variable "location" {
  description = "Provide the location/Region under which resources to be managed"
  type        = string
  default     = "East US"
}

variable "resource_group_names" {
  description = "A list of resource group names to create."
  type        = map(string)
  default = {
    "webapp-dev"  = "West US"
    "webapp-prod" = "West US"
  }
}

variable "storage_accounts" {
  description = "A map of storage account configurations."
  type = map(object({
    name                     = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
  default = {
    "webapp-dev" = {
      name                     = "storagewebdev"
      location                 = "West US"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    },
    "webapp-prod" = {
      name                     = "way2techstackprod"
      location                 = "West US"
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