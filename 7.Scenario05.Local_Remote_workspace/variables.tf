variable "location" {
  description = "Provide the location/Region under which resources to be managed"
  type        = string
  default     = "East US"
}

variable "resource_group_names" {
  description = "A list of resource group names to create."
  type = map(object({
    name     = string
    location = string
  }))
  default = {
    "default" = {
      name     = "way2techstackrg"
      location = "West US"
    },
    "dev" = {
      name     = "way2techstackrgdev"
      location = "West US"
    },
    "prod" = {
      name     = "way2techstackrgprod"
      location = "East US"
    }
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
    "default" = {
      name                     = "way2techstack"
      location                 = "West US"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    },
    "dev" = {
      name                     = "way2techstackdev"
      location                 = "West US"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    },
    "prod" = {
      name                     = "way2techstackprod"
      location                 = "East US"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
}