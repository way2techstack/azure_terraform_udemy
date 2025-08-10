locals {
  common_tags = {
    "Environment" = "Development"
    "Team"        = "ADO Team"
  }

  vnet_tags = merge(
    var.vnet_tags,
    local.common_tags
  )

  resource_group_tags = merge(
    var.rg_tags,
    local.common_tags
  )
}