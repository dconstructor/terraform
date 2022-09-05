locals {
  dbs=["admin01"]
}
module "ec2_rds_module" {
    source = "./modules/mod-rds"
    count = length(local.dbs)
    username=local.dbs[count.index]
    password="${local.dbs[count.index]}abcABC123"
}