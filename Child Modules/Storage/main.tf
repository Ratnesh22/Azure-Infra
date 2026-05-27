resource "azurerm_storage_account" "stg" {

for_each =var.stg

name =each.value.stg_name
resource_group_name = each.value.rg_name
location = each.value.rg_location
account_tier = each.value.account_tier
account_replication_type = each.value.account_replication_type
tags =each.value.tags

}

resource "azurerm_storage_container" "container" {

for_each =var.stg

name =each.value.container_name
storage_account_id= azurerm_storage_account.stg[each.key].id
container_access_type =each.value.container_access_type

}