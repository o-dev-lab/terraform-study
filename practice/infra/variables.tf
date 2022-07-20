
variable "region" {
  default = "ap-southeast-1"
}


variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "192.168.0.0/16"
}
variable "vpc_name" {
  description = "VPC Name"
  default     = "yk-vpc"
}
variable "env" {
  description = "Project Environment"
  type        = string
  default     = "prd"
}

variable "subnetting" {
  description = "VPC CIDR"
  type        = string
  default     = "192.168.0.0/16"
}
variable "azs" {
  description = "VPC Name"
  default     = "yk-vpc"
}
locals {
  region = var.region
  azs    = ["${local.region}a", "${local.region}c"]
}