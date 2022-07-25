
variable "env" {}
variable "azs" {
  description = "The List of Availability Zones"
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2c"]
}
variable "subnetting" {
  description = "The CIDR block List of the Subnets"
  type        = list(string)
}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "igw_id" {
  description = "The ID of the IGW"
  type        = string
}

variable "nat_id" {
  description = "The ID of the NATGW"
  type        = string
}