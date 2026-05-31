rgs = {

  rg1 = {

    rg_name     = "Nokia-RG"
    rg_location = "west us"
    rg_tags = {

      environment = "dev"
      cost_centre = "NPO"

    }

  }

  rg2 = {

    rg_name     = "Bharti-RG"
    rg_location = "west us"
    rg_tags = {

      environment = "dev"
      cost_centre = "NPO"

    }

  }


}

stg = {

  stg1 = {


    stg_name                 = "nokiastg69193669"
    rg_name                  = "Nokia-RG"
    rg_location              = "west us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {

      environment = "dev"
      cost_centre = "NPO"

    }
    container_name        = "nokiacontainer69193669"
    rg_name               = "Nokia-RG"
    container_access_type = "blob"
  }

  stg2 = {


    stg_name                 = "bhartistg69193668"
    rg_name                  = "Bharti-RG"
    rg_location              = "west us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {

      environment = "dev"
      cost_centre = "NPO"

    }
    container_name        = "bharticontainer69193668"
    rg_name               = "Bharti-RG"
    container_access_type = "blob"
  }
}
networking ={

  nw1 ={

vnet_name ="nokia_vnet"
rg_name ="Nokia-RG"
rg_location ="west us"
address_space =["10.0.0.0/16"]

subnet ={
subnet1 ={
subnet_name ="nokia_frontend_subnet"
address_prefixes =["10.0.0.0/24"]  

  }
  subnet2 ={
subnet_name ="nokia_backend_subnet"
address_prefixes =["10.0.1.0/24"]  

  }
   subnet3 ={
subnet_name ="AzureBastionSubnet"
address_prefixes =["10.0.2.0/24"]  

  }
  subnet4 ={
subnet_name ="Appgw_subnet"
address_prefixes =["10.0.3.0/24"]  

  }
  }
  }
 nw2 ={
  
   vnet_name ="bharti_vnet"
rg_name ="Bharti-RG"
rg_location ="west us"
address_space =["10.1.0.0/16"]
subnet ={
subnet1 ={
subnet_name ="bharti_frontend_subnet"
address_prefixes =["10.1.0.0/24"]  


subnet2 ={
subnet_name ="bharti_backend_subnet"
address_prefixes =["10.1.2.0/24"]  

}

}

 }}}

 pip ={


pip1 ={
pip_name ="Nokia_pip"
rg_name ="Nokia-RG"
rg_location ="west us"
allocation_method = "Static"

  }
pip2 ={
pip_name ="Bharti_pip"
rg_name ="Nokia-RG"
rg_location ="west us"
allocation_method = "Static"

  }
pip3 ={
pip_name ="bastion_pip"
rg_name ="Nokia-RG"
rg_location ="west us"
allocation_method = "Static"
}
pip4 ={
pip_name ="lb_pip"
rg_name ="Nokia-RG"
rg_location ="west us"
allocation_method = "Static"
}
pip5 ={
pip_name ="appgw_pip"
rg_name ="Nokia-RG"
rg_location ="west us"
allocation_method = "Static"
}
 }
compute = {

compute1 ={

subnet_name = "nokia_frontend_subnet"
vnet_name = "nokia_vnet"
pip_name ="Nokia_pip"

nic_name = "nokia-nic"
rg_name ="Nokia-RG"
rg_location ="west us"

ip_configuration ={

ip_configuration1 ={
ipconf_name ="nokia_ipconfig"
private_ip_address_allocation ="Dynamic"
public_ip_address_id =false
}
}
nsg_name = "nokia-nsg"

security_rule ={
security_rule1 ={
 security_rule_name         = "nokia_nsg_security_rule"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"




}

}

vm_name = "nokiavm"
size = "Standard_D2s_v3"
admin_username ="mynokiavm"
admin_password ="Qwerty12456"
disable_password_authentication= false

os_disk ={

  os_disk1 ={

caching= "ReadWrite"
        storage_account_type = "Standard_LRS"

  }
}
source_image_reference ={

  source_image_reference1 ={


     publisher ="Canonical"
    offer ="0001-com-ubuntu-server-jammy"
    sku ="22_04-lts"
    version ="latest"
  }
}

}
compute2 ={

subnet_name = "nokia_backend_subnet"
vnet_name = "nokia_vnet"
pip_name ="Bharti_pip"

nic_name = "bharti-nic"
rg_name ="Nokia-RG"
rg_location ="west us"

ip_configuration ={

ip_configuration1 ={
ipconf_name ="bharti_ipconfig"
private_ip_address_allocation ="Dynamic"
public_ip_address_id =false
}
}
nsg_name = "bharti-nsg"

security_rule ={
security_rule1 ={
 security_rule_name         = "bharti_nsg_security_rule"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"




}

}

vm_name = "bhartivm"
size = "Standard_D2s_v3"
admin_username ="mybhartivm"
admin_password ="Qwerty12456"
disable_password_authentication= false

os_disk ={

  os_disk1 ={

caching= "ReadWrite"
        storage_account_type = "Standard_LRS"

  }
}
source_image_reference ={

  source_image_reference1 ={


     publisher ="Canonical"
    offer ="0001-com-ubuntu-server-jammy"
    sku ="22_04-lts"
    version ="latest"
  }
}

}





 }
 host ={

host1 ={
subnet_name ="AzureBastionSubnet"
vnet_name ="nokia_vnet"
rg_name ="Nokia-RG"
pip_name ="bastion_pip"
host_name ="Nokia_Bastion_Host"
rg_location ="west us"

ip_configuration ={
  
  
ip_configuration1 ={
  ipconf_name ="nokia_ipconfig"


}
}

 }
 }
 sql = {

  sql1 ={

sql_server_name ="nokiamssqlserver22052026"
  rg_name = "Nokia-RG"
  rg_location ="west us"
  sql_server_version ="12.0"
  admin_login = "nokiamssqlserver"
  admin_password ="Qwerty@123456"
  minimum_tls_version  ="1.2"
  
  azuread ={
azuread1 = {
auth =true
  login_username ="nokiaserver"
  
}

  }
  }
 }
 dbs = {


  dbs1 ={


server_name ="nokiamssqlserver22052026"
rg_name ="Nokia-RG"
db_name = "nokiadb"
collation ="SQL_Latin1_General_CP1_CI_AS"
license_type ="LicenseIncluded"
size =2
sku_name ="S0"
enclave_type ="VBS"

  }
 }
 kvs ={

kvs1 ={

kv_name                        = "nokiakv111111"
  rg_location                    = "west us"
  rg_name   = "Nokia-RG"
  disk_encryption = true
  retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"
  rbac_authorization_enabled = true


# access_policy ={
# access_policy1 ={
# key_permissions = [
#       "Get",
#     ]
#     secret_permissions = [
#       "Get","Set","List",
#     ]
#     storage_permissions = [
#       "Get",
#     ]


# }

# }


}
 }

secrets ={

  secrets1 ={

kv_name ="nokiakv111111"
rg_name ="Nokia-RG"
secret_name ="adminusernamenokiavm"
secret_value ="admin@nokiavm"


  }
  secrets2 ={
  kv_name ="nokiakv111111"
rg_name ="Nokia-RG"
secret_name ="adminpasswordnokiavm"
secret_value ="Qwerty@123456"

}
 secrets3 ={
  kv_name ="nokiakv111111"
rg_name ="Nokia-RG"
secret_name ="adminusernamebhartivm"
secret_value ="admin@bhartivm"
}
secrets4 ={
  kv_name ="nokiakv111111"
rg_name ="Nokia-RG"
secret_name ="adminpasswordnokiavm"
secret_value ="Qwerty@123456"
}
secrets5 ={
  kv_name ="nokiakv111111"
rg_name ="Nokia-RG"
secret_name ="adminloginmssqlserver"
secret_value ="admin@nokiamssqlserver"
}
secrets6 ={
  kv_name ="nokiakv111111"
rg_name ="Nokia-RG"
secret_name ="adminpasswordmssqlserver"
secret_value ="Qwerty@123456"
}
}
lbs ={

  lbs1 ={

pip_name ="lb_pip"
rg_name ="Nokia-RG"
lb_name ="Nokia-LB"
rg_location ="west us"
sku ="Standard"
probe_name ="nokialbprobe"
port =22
pool_name ="nokiabappool"
lbrule_name ="nokialbrule"
protocol ="Tcp"
frontend_port =3389
backend_port =3389
frontipconf_name ="NokiafrontendIP"

  loadb ={

    loadb1={

  frontipconf_name ="NokiafrontendIP"

  }
  }
  }
  }
  appgw ={

    appgw1 ={

      appgw_name ="nokia-gw"
rg_name ="Nokia-RG"
rg_location ="west us"
vnet_name ="nokia_vnet"
subnet_name ="Appgw_subnet"
pip_name ="appgw_pip"

skus ={

  skus1 ={
    name ="Standard_v2"
    tier ="Standard_v2"
    capacity = 2
  }
}
gwipconf ={

  gwipconf1 ={

    name ="appgwipconf"
  }
}
fport ={

  fport1 ={

    name = "appgwfport"
    port = 80
  }
}
fip ={

  fip1 ={

    name ="appgwfip"

  }
}
bap ={

  bap1 ={

    name ="appgwbap"
  }
}
backend_http_settings ={

  backend_http_settings1 ={
name ="appgwbapsettings"
    cookie_based_affinity ="Disabled"
    path ="/path1/"
    port =80
    protocol ="Http"
    request_timeout =60

  }
}
listner ={

  listner1 ={
name ="appgwlistner"
    frontend_ip_configuration_name ="appgwfip"
    frontend_port_name ="appgwfport"
    protocol ="Http"

  }
}
lbrule ={

  lbrule1 ={

name ="appgwlbrule"
priority = 9
rule_type ="Basic"
http_listener_name ="appgwlistner"
backend_address_pool_name ="appgwbap"
backend_http_setting_name ="appgwbapsettings"


  }
}
    }
  }