locals {

  subnet_cidrs = {
    pub-bastion = [cidrsubnet(var.vpc_cidr, 8, 1), cidrsubnet(var.vpc_cidr, 8, 2)],
    pri-web = [cidrsubnet(var.vpc_cidr, 8, 3), cidrsubnet(var.vpc_cidr, 8, 4)],
    pri-was = [cidrsubnet(var.vpc_cidr, 8, 5), cidrsubnet(var.vpc_cidr, 4, 6)],
    pri-db  = [cidrsubnet(var.vpc_cidr, 8, 7), cidrsubnet(var.vpc_cidr, 4, 8)]
  }
}

############################################################################################################
# VPC
############################################################################################################


module "vpc" {
  source   = "../../modules/network/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

}

############################################################################################################
# Subnet
############################################################################################################

module "subnet" {
  source   = "../../modules/network/subnet"
  for_each = local.subnet_cidrs

  vpc_id     = module.vpc.vpc_id
  azs        = local.azs
  env        = each.key
  subnetting = each.value

}



############################################################################################################
# Nat GW
############################################################################################################

module "nat" {

  source = "../../modules/network/natgw"
  sunbet_id = module.subnet["pub-bastion"].subnet_ids.0
}





############################################################################################################
# Route table
############################################################################################################

module "rt" {
  source = "../../modules/network/route"
  for_each = local.subnet_cidrs

  env    = each.key
#  routings = {}
#  rt_id = ""
#  subnetting = each.value
  vpc_id = module.vpc.vpc_id
}

#module "rt_asso" {
#  source = "../../modules/network/route"
#  for_each = local.subnet_cidrs
#
#  env    = each.key
#  routings = {}
#  rt_id = module.subnet[]
#  subnetting = each.value
#  vpc_id = module.vpc.vpc_id
#}