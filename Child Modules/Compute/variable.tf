variable "compute" {

  type = map(object({

    subnet_name = string
    vnet_name   = string
    pip_name    = string


    nic_name    = string
    rg_name     = string
    rg_location = string

  

    ip_configuration = map(object({

      ipconf_name                   = string
      private_ip_address_allocation = string
      public_ip_address_id          = bool

    }))

    nsg_name = string

    security_rule = map(object({

        security_rule_name         = string
        priority                   = number
        direction                  = string
        access                     = string
        protocol                   = string
        source_port_range          = string
        destination_port_range     = string
        source_address_prefix      = string
        destination_address_prefix = string


      }))

    

vm_name = string
size = string
admin_username =string
admin_password =string
disable_password_authentication= bool

os_disk =map(object({
        caching= string
        storage_account_type = string
}))
    
source_image_reference =map(object({


    publisher =string
    offer =string
    sku =string
    version =string
    }))



  }))
}