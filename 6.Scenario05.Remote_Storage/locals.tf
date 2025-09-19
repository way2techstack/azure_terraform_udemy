locals {
  storage_tags = {
    "webapp-dev" = {
      "Environment" = "Development"
      "App"         = "Storage"
    },
    "webapp-prod" = {
      "Environment" = "Production"
      "App"         = "Storage"
    }
  }
}