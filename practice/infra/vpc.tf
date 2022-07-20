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
  cidr_block = var.subnetting[count.index]
  azs        = local.azs
  env        = each.key
  subnetting = each.value

}

