###################################################
# Create EC2
###################################################

resource "aws_instance" "ec2" {
  subnet_id              = var.attribute.subnet_id
  ami                    = var.attribute.ami
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups
#  iam_instance_profile   = lookup(var.attribute, "ec2_role", var.default_ec2_role)

  instance_type     = lookup(var.attribute, "instance_type", "t3.medium")
  source_dest_check = lookup(var.attribute, "isProxy", false)
  private_ip        = lookup(var.attribute, "private_ip", null)

  tags = merge(
    {
      Name = "${var.env}-ec2",
      Env  = "${var.env}"
    },
    var.tags,
  )
}

###################################################
# Create EIP
###################################################

resource "aws_eip" "eip" {
  count = lookup(var.attribute, "isPrivate", false) ? 0 : 1

  vpc = true

  instance                  = aws_instance.ec2.id
  associate_with_private_ip = aws_instance.ec2.private_ip

  tags = merge(
    {
      Name = "${var.env}-ec2",
      Env  = "${var.env}"
    },
    var.tags,
  )
}