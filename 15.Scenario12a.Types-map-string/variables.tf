variable "rg_names" {
  description = "Provide a List of resource names to be provisioned in East US region"
  type        = map(string)
  default = {
    "W2Tech01" = "East US"
    "W2Tech02" = "West US"
    "W2Tech03" = "East US"
  }
}