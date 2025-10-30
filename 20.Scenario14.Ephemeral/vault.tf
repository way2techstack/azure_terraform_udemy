# data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "way2techstack" {
  name = var.rg_name
}

data "azurerm_key_vault" "mysql_vault" {
  name                = var.mysql_vault_name
  resource_group_name = data.azurerm_resource_group.way2techstack.name
}

/*
data "azurerm_key_vault_secret" "mysql_username" {
  name         = "mysql-username"
  key_vault_id = data.azurerm_key_vault.mysql_vault.id
}

data "azurerm_key_vault_secret" "mysql_password" {
  name         = "mysql-password"
  key_vault_id = data.azurerm_key_vault.mysql_vault.id
}
*/

ephemeral "azurerm_key_vault_secret" "mysql_username_ephemeral" {
  name         = "mysql-username"
  key_vault_id = data.azurerm_key_vault.mysql_vault.id

  depends_on = [data.azurerm_key_vault.mysql_vault]
}

ephemeral "azurerm_key_vault_secret" "mysql_password_ephemeral" {
  name         = "mysql-password"
  key_vault_id = data.azurerm_key_vault.mysql_vault.id

  depends_on = [data.azurerm_key_vault.mysql_vault]
}

check "vault_soft_delete" {
  data "azurerm_key_vault" "vault_retain" {
    name = var.mysql_vault_name
    resource_group_name = data.azurerm_resource_group.way2techstack.name
  }
  assert {
    condition = data.azurerm_key_vault.vault_retain.sku_name == "premium"
    error_message = "Vault SKU should be set to Standard, for prod its Premium"
  }
}

/*
# Optional: For provisioning Key-vault resource
resource "azurerm_key_vault" "mysql_vault" {
  name                        = var.mysql_vault_name
  location                    = azurerm_resource_group.resource_group.location
  resource_group_name         = azurerm_resource_group.resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}

resource "azurerm_key_vault_access_policy" "mysql_vault_policy" {
  key_vault_id = azurerm_key_vault.mysql_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Get", "List"
  ]

  secret_permissions = [
    "List",
    "Get",
  ]
}
*/