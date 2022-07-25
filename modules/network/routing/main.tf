
############################################################################################################
# Routing
############################################################################################################

#
##라우팅 테이블의 라우팅
#resource "aws_route" "routing" {
#  for_each       = var.routings
#  route_table_id = var.rt_id

#  destination_cidr_block     = length(regexall("[a-z]", each.value.dst_cidr)) == 0 ? each.value.dst_cidr : null
#  gateway_id                = contains(local.gateway, substr(each.value.dst_id, 0, 3)) ? each.value.dst_id : null
#  nat_gateway_id            = substr(each.value.dst_id, 0, 3) == "nat" ? each.value.dst_id : null
#}