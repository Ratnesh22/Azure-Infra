variable "rgs" {

  type = map(object({

    rg_name     = string
    rg_location = string
    rg_tags     = optional(map(string))


  }))

}
