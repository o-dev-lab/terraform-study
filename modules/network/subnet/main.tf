
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

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
#    gateway_id = var.destination == "igw" ? "" : null
    gateway_id = substr(var.env,0,3) == "igw" ? var.igw_id : null
    nat_gateway_id = substr(var.env,0,3) == "nat" ? var.nat_id : null
  }

  tags = {
    Name = "${var.env}-rt"
  }
}

resource "aws_route_table_association" "rt_asso" {
  count = length(var.subnetting)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}