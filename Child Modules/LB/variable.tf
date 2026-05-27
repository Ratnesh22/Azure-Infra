variable "lbs" {

type =map(object({

pip_name =string
rg_name =string
lb_name =string
rg_location =string
sku =string
probe_name =string
port =number
pool_name =string
lbrule_name =string
protocol =string
frontend_port =number
backend_port =number
frontipconf_name =string

loadb =map(object({


    frontipconf_name =string
}))

}))

}


    
