variable "environment" {
  description = "Specity environment names in which resource have to be managed"
  type        = string
}

variable "rg_names" {
  description = "Provide a List of resource names to be provisioned in specified region"
  type = map(map(object({
    location = string
    tags     = map(string)
  })))
  default = {
    "dev" = {
      "W2Tech01" = {
        location = "West US"
        tags = {
          "Name"        = "Way2TechStack01"
          "Environment" = "Development"
        }
      }
      "W2Tech02" = {
        location = "West US"
        tags = {
          "Name"        = "Way2TechStack02"
          "Environment" = "Development"
        }
      }
    }
    "prod" = {
      "W2Tech01" = {
        location = "East US"
        tags = {
          "Name"        = "Way2TechStack01"
          "Environment" = "Production"
        }
      }
      "W2Tech02" = {
        location = "East US"
        tags = {
          "Name"        = "Way2TechStack02"
          "Environment" = "Production"
        }
      }
    }
  }
}