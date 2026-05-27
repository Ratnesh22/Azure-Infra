data "azurerm_mssql_server" "mssql" {

    for_each =var.dbs
name = each.value.server_name
resource_group_name = each.value.rg_name
}

resource "azurerm_mssql_database" "db" {

    for_each = var.dbs

  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.mssql[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.size
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

}
