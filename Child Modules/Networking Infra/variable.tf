variable "networking" {

    type =map(object({

vnet_name =string
rg_name =string
rg_location =string
address_space =list(string)

subnet =map(object({

 subnet_name =string
address_prefixes =list(string)

    }))
    }))


    
  
}