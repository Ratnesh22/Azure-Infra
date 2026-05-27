data "azurerm_subnet" "subnet" {

  for_each = var.compute

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip" {

  for_each            = var.compute
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_network_interface" "nic" {

  for_each = var.compute

  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location

  dynamic "ip_configuration" {

    for_each = each.value.ip_configuration

    content {

      name                          = ip_configuration.value.ipconf_name
      subnet_id                     = data.azurerm_subnet.subnet[each.key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id

    }


  }
}
resource "azurerm_network_security_group" "nsg" {

  for_each = var.compute

  name                = each.value.nsg_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  dynamic "security_rule" {

    for_each = each.value.security_rule
    content {
      name                       = security_rule.value.security_rule_name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_linux_virtual_machine" "vm" {

  for_each = var.compute

  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.rg_location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id, ]
  disable_password_authentication = each.value.disable_password_authentication

  dynamic "os_disk" {

    for_each = each.value.os_disk
    content {

      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type


    }
  }

  dynamic "source_image_reference" {

    for_each = each.value.source_image_reference

    content {

      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version



    }

  }

}
