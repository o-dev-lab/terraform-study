
############################################################################################################
# Route Table
############################################################################################################

#라우팅 테이블 생성
resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env}-rt"
  }
}
#
#라우팅 테이블에 연결될 서브넷
resource "aws_route_table_association" "rt_asso" {
  count = length(var.subnetting)
  subnet_id      = var.subnetting[count.index].id
  route_table_id = aws_route_table.rt.id
}
#
##라우팅 테이블의 라우팅
#resource "aws_route" "routing" {
#  for_each       = var.routings
#  route_table_id = aws_route_table.rt.id

#  destination_cidr_block     = length(regexall("[a-z]", each.value.dst_cidr)) == 0 ? each.value.dst_cidr : null
#  gateway_id                = contains(local.gateway, substr(each.value.dst_id, 0, 3)) ? each.value.dst_id : null
#  nat_gateway_id            = substr(each.value.dst_id, 0, 3) == "nat" ? each.value.dst_id : null
#}