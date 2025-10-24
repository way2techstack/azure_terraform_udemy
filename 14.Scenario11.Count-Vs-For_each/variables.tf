variable "rg_names" {
  description = "Provide a List of resource names to be provisioned in East US region"
  type        = list(string)
  default     = ["W2Tech01", "W2Tech02", "W2Tech03", "W2Tech04"]
}