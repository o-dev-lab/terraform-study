variable "env" {}
#variable "subnetting" {
#  description = "The CIDR block List of the Subnets"
#  type        = list(string)
#}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

#variable "routings" {
#  description = "Routing set"
#}
#
#variable "rt_id" {
#  description = "The ID of the rt"
#  type        = string
#}