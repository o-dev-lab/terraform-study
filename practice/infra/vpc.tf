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
  vpc_name = var.vpc_name

}