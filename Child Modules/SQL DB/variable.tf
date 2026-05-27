variable "dbs" {

type = map(object({

server_name =string
rg_name =string
db_name = string
collation =string
license_type =string
size =number
sku_name =string
enclave_type =string



















}))

}