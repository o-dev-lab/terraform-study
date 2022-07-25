variable "env" {
  description = "Project Environment"
  type        = string
}


variable "attribute" {
  description = "EC2 Attribute Set"
}

#variable "security_groups" {
#  description = "The List of Security Groups"
#  type        = list(string)
#}

#variable "default_ec2_role" {
#  description = "Default IAM Instance Profile"
#  type        = string
#  default     = null
#}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "EC2 PEM key name"
}