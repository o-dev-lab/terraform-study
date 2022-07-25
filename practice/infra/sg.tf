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

locals {
  sg_rules = [
    {
      from_port = "22"
      protocol  = "tcp"
      to_port   = "22"
      type      = "ingress"
      description = "BSG IP"
      cidr_blocks = "121.133.35.204/32"
    },
    {
      from_port = 0
      protocol  = "-1"
      to_port   = 0
      type      = "ingress"
      description = "VPC CIDR"
      cidr_blocks = var.vpc_cidr
    },
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      type      = "egress"
      description = ""
    }
  ]
}

module "security_groups" {
  source    = "../../modules/network/sg"
  vpc_id    = module.vpc.vpc_id
  env       = "vpc"
  sg_rules  = local.sg_rules
}

