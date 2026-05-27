resource "azurerm_virtual_network" "vnet" {

for_each = var.networking

name =each.value.vnet_name
resource_group_name = each.value.rg_name
location =each.value.rg_location
address_space = each.value.address_space


dynamic "subnet" {

for_each =each.value.subnet

content {

name =subnet.value.subnet_name
address_prefixes =subnet.value.address_prefixes


}


}

  
}