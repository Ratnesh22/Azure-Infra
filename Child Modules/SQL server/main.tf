data "azurerm_client_config" "current" {}

resource "azurerm_mssql_server" "sql_server" {

for_each =var.sql

  name                         = each.value.sql_server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.rg_location
  version                      = each.value.sql_server_version
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_password
  minimum_tls_version          = each.value.minimum_tls_version 

  dynamic "azuread_administrator" {

    for_each =each.value.azuread

    content{
        azuread_authentication_only =azuread_administrator.value.auth
    login_username = azuread_administrator.value.login_username
    object_id      = data.azurerm_client_config.current.object_id
  }

  }

}