variable "env" {
  description = ""
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "sg_rules" {
  description = "The Rule Set List of the Security Group"
  type        = list(any)
  default = [
    {
      from_port = ""
      protocol  = ""
      to_port   = ""
      type      = ""
      cidr_blocks      = ""
      description      = ""
    }
  ]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
#
#variable "from_port" {
#  description = ""
#  type        = string
#}
#variable "protocol" {
#  description = ""
#  type        = string
#}
#variable "to_port" {
#  description = ""
#  type        = string
#}
#variable "type" {
#  description = ""
#  type        = string
#}
#
