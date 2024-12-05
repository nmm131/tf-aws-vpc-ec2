variable "security_groups" {
  description = "The ID of the security groups"
  type        = list(string)
}

variable "subnets" {
  description = "The ID of the subnets"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
