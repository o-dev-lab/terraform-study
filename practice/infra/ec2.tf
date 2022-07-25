locals {
  # AmazonEC2RoleforSSM Role
#  ec2ssm_role = data.terraform_remote_state.global.outputs.ec2ssm_role

  # 필수 : vpc_name / subnet_id / ami
  # 옵션 : private_ip / isProxy / isPrivate / instance_type / ec2_role
  # isProxy, isPrivate : default값 false
  # project-env-name인 key 콘솔에서 만든 후 진행
  ec2_info = {
    bastion = {
      subnet_id  = module.subnet["pub-bastion"].subnet_ids.0
      ami        = "ami-0fc5b5d2f35b0c1f7"
    },

    pri-web1 = {
      subnet_id = module.subnet["pri-web"].subnet_ids.0
      ami       = "ami-0eb14fe5735c13eb5"
      isPrivate  = true
    },
    pri-web2 = {
      subnet_id = module.subnet["pri-web"].subnet_ids.1
      ami       = "ami-0eb14fe5735c13eb5"
      # 기본 Amazon Linux 2 AMI
      isPrivate  = true
    },
    pri-was1 = {
      subnet_id  = module.subnet["pri-was"].subnet_ids.0
      ami        = "ami-0eb14fe5735c13eb5"
      isPrivate  = true
    },
    pri-was2 = {
      subnet_id  = module.subnet["pri-was"].subnet_ids.1
      ami        = "ami-0eb14fe5735c13eb5"
      isPrivate  = true
    }
  }
}

module "ec2" {
  source   = "../../modules/instance/ec2"
  for_each = local.ec2_info

  env             = each.key
  attribute        = each.value
#  security_groups  = [module.security_groups["${each.value.vpc_name}-${each.key}"].sg_id]
#  default_ec2_role = local.ec2ssm_role
  key_name         = "yk-southeast1"
  security_groups  = []
}