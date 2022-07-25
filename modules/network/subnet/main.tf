
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
  tags = {
    Name = "${var.env}-rt"
  }
}

resource "aws_route_table_association" "rt_asso" {
  count = length(var.subnetting)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}