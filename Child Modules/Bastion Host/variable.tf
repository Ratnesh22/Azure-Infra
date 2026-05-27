variable "host" {

type =map(object({

subnet_name =string
vnet_name =string
rg_name =string
pip_name =string
host_name =string
rg_location =string

ip_configuration =map(object({

ipconf_name =string    
}))

}))  
}