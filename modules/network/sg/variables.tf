variable "env" {}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

#variable "sg_rules" {
#  description = "The Rule Set List of the Security Group"
#  type        = list(any)
#}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}