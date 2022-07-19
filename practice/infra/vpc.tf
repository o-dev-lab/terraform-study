 ### VPC


 locals {

 }



 variable "vpc_cidr" {
   description = "VPC CIDR"
   type        = string
   default     = "192.168.0.0/16"
 }
 variable "vpc_name" {
   description = "VPC Name"
   type        = string
   default     = "yk-vpc"
 }
 variable "env" {
   description = "Project Environment"
   type        = string
   default     = "prd"
 }

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}