locals {
  sg_name = "${var.env}-sg"
}

###################################################
# Security Group
###################################################

resource "aws_security_group" "sg_group" {
  name        = local.sg_name
  description = local.sg_name
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = local.sg_name
      Env  = "${var.env}"
    }
  )
}

###################################################
# Security Group Rule
###################################################
#
#resource "aws_security_group_rule" "sg_rule" {
#  for_each                 = { for rule in var.sg_rules : rule.key => rule }
#  security_group_id        = aws_security_group.sg_group.id
#  type                     = each.value.rule_type
#  from_port                = each.value.from_port
#  to_port                  = each.value.to_port
#  protocol                 = each.value.protocol
#  cidr_blocks              = length(regexall("[a-z]", each.value.src_or_dst)) == 0 ? [each.value.src_or_dst] : null
##  prefix_list_ids          = substr(each.value.src_or_dst, 0, 2) == "pl" ? [each.value.src_or_dst] : null
##  source_security_group_id = substr(each.value.src_or_dst, 0, 2) == "sg" ? each.value.src_or_dst : null
##  self                     = each.value.src_or_dst == "self" ? true : null
#  description              = lookup(each.value, "desc", null)
#}

resource "aws_security_group_rule" "sg_rule" {
  for_each = var.sg_rules
  security_group_id        = aws_security_group.sg_group.id

  from_port = each.value.type
  protocol  = each.value.protocol
  to_port   = each.value.to_port
  type      = each.value.type
  cidr_blocks      = each.value.cidr_blocks
  description      = each.value.description
}