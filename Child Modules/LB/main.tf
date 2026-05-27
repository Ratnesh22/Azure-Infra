data "azurerm_public_ip" "pip" {

  for_each            = var.lbs
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_lb" "lb" {

    for_each =var.lbs
name = each.value.lb_name
location = each.value.rg_location
resource_group_name = each.value.rg_name
sku = each.value.sku

dynamic "frontend_ip_configuration" {

    for_each = each.value.loadb
    content {
name = frontend_ip_configuration.value.frontipconf_name
public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}
}
}
resource "azurerm_lb_probe" "probe" {

    for_each =var.lbs
loadbalancer_id = azurerm_lb.lb[each.key].id
name = each.value.probe_name
port = each.value.port
}
resource "azurerm_lb_backend_address_pool" "bappool" {

    for_each =var.lbs

  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.pool_name
}
resource "azurerm_lb_rule" "lbrule" {

    for_each =var.lbs

name = each.value.lbrule_name
loadbalancer_id = azurerm_lb.lb[each.key].id
protocol = each.value.protocol
frontend_port = each.value.frontend_port
backend_port = each.value.backend_port
frontend_ip_configuration_name = each.value.frontipconf_name
}