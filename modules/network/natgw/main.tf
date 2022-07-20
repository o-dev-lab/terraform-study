
############################################################################################################
# NAT Gateway
############################################################################################################

resource "aws_eip" "eip" {
  vpc = true

  tags =     {
      Name = "nat-eip"
    }

}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.sunbet_id

  tags = {
    Name = "NAT GW"
  }

}