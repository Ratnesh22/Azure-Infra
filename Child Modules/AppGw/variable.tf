variable "appgw" {

type =map(object({

appgw_name =string
rg_name =string
rg_location =string
vnet_name =string
subnet_name =string
pip_name =string

skus =map(object({

name = string
tier =string
capacity =number

}))
gwipconf =map(object({

    name =string

}))

fport =map(object({

name = string
port =number

}))

fip =map(object({
name =string

}))
bap =map(object({

    name =string
}))

backend_http_settings =map(object({
    name =string
    cookie_based_affinity =string
    path =string
    port =number
    protocol =string
    request_timeout =number

}))
listner =map(object({
    name =string
    frontend_ip_configuration_name =string
    frontend_port_name =string
    protocol =string

}))
lbrule =map(object({
name =string
priority =number
rule_type =string
http_listener_name =string
backend_address_pool_name =string
backend_http_setting_name =string


}))


}))

}