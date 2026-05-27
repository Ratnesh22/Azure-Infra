module "RG" {

source = "../../Child Modules/RG"
rgs =var.rgs

}
module "Storage"{

depends_on = [ module.RG ]
source = "../../Child Modules/Storage"
stg =var.stg

}
module "Networking_Infra" {

    depends_on = [ module.RG ]
    source = "../../Child Modules/Networking Infra"
    networking =var.networking
  
}
module "PIP" {

depends_on = [ module.RG ]
source = "../../Child Modules/PIP"
pip =var.pip

  
}
module "compute" {

    depends_on = [ module.RG,module.Networking_Infra,module.PIP ]
  source ="../../Child Modules/Compute"
  compute =var.compute
}
module "Bastion_Host"{

depends_on = [ module.Networking_Infra,module.PIP ]
source ="../../Child Modules/Bastion Host"
host = var.host

}
module  "sqlserver"{
depends_on = [ module.RG ]
source = "../../Child Modules/SQL server"
sql = var.sql

}
module "sqldb"{

depends_on = [ module.sqlserver ]
source ="../../Child Modules/SQL DB"
dbs = var.dbs

}
module "keyvault" {

depends_on = [ module.RG ]
source ="../../Child Modules/Key-vault"
kvs =var.kvs

}
module "secrets"{
depends_on = [ module.keyvault ]
source = "../../Child Modules/Secrets"
secrets =var.secrets

}
module "LB"{

depends_on = [ module.RG,module.PIP ]
source = "../../Child Modules/LB"
lbs =var.lbs


}
module "AppGw"{

depends_on = [ module.RG,module.PIP ]

source = "../../Child Modules/AppGw"
appgw =var.appgw
}