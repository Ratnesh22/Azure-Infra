variable "pip"{

type =map(object({

pip_name =string
rg_name =string
rg_location =string
allocation_method =string


}))

}