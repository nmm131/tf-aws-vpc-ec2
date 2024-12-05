variable "ami_id" {
  description = "The ID of the AMI"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "The ID of the vpc security groups"
  type        = string
}
