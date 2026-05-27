data "azurerm_client_config" "current" {
}
data "azurerm_subscription" "primary" {
}
resource "azurerm_key_vault" "kv" {

    for_each = var.kvs

  name                        = each.value.kv_name
  location                    = each.value.rg_location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = each.value.disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled

  sku_name = each.value.sku_name
  rbac_authorization_enabled = each.value.rbac_authorization_enabled

  # dynamic "access_policy" {

  #   for_each =each.value.kvs
  #   content {
  #   tenant_id = data.azurerm_client_config.current[each.key].tenant_id
  #   object_id = data.azurerm_client_config.current[each.key].object_id

  #   key_permissions = each.value.key_permissions
  #   secret_permissions = each.value.secret_permissions
  #   storage_permissions = each.value.storage_permissions
#   }
# # }
}
resource "azurerm_role_assignment" "kv_admin" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id # Or a specific user/group ID
}

