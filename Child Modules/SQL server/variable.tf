variable "sql" {

type =map(object({

sql_server_name =string
  rg_name =string
  rg_location =string
  sql_server_version =string
  admin_login =string
  admin_password = string
  minimum_tls_version  =string
  azuread =map(object({


    auth=bool
    login_username =string

  }))


}))

}