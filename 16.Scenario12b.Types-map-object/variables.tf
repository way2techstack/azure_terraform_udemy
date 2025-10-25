variable "rg_names" {
  description = "Provide a List of resource names to be provisioned in East US region"
  type = map(object({
    location = string
    tags     = map(string)
  }))
  default = {
    "W2Tech01" = {
      location = "East US"
      tags = {
        "Name"        = "W2TechStack01"
        "Environment" = "Development"
      }
    }
    "W2Tech02" = {
      location = "West US"
      tags = {
        "Name"        = "W2TechStack02"
        "Environment" = "Development"
      }
    }
  }
}