
############################################################################################################
# Subnet
############################################################################################################

resource "aws_subnet" "subnet" {
  count = length(var.subnetting)
  vpc_id = var.vpc_id
  cidr_block        = var.subnetting[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.env}-sub-${substr(var.azs[count.index], -1, -1)}"
  }

}

