#locals {
#  sg_csvs       = fileset("./sg_csv/", "*.csv")
#  sg            = toset([for f in local.sg_csvs : trimsuffix(f, ".csv")])
#  sg_to_sg_list = csvdecode(file("./sg_to_sg.csv"))
#}
#
#module "security_groups" {
#  source   = "../../modules/network/sg"
#  for_each = local.sg
#
#  vpc_id   = regexall("[a-z]+", each.key).0 == "pub" ? module.pub_vpc.vpc_id : module.pri_vpc.vpc_id
#  vpc_name = regexall("[a-z]+", each.key).0
#  project  = var.project
#  env      = var.env
#  name     = trimprefix(each.key, "${regexall("[a-z]+", each.key).0}-")
#  sg_rules = csvdecode(file("./sg_csv/${each.key}.csv"))
#}

module "security_groups" {
  source   = "../../modules/network/sg"
  vpc_id   = module.vpc.vpc_id

  env      = "vpc"
}