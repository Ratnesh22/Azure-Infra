variable "stg" {

type =map(object({

stg_name =string
rg_name = string
rg_location = string
account_tier = string
account_replication_type = string
tags = map(string)

container_name =string
container_access_type =string
    }))


}