variable "subnet_ids" {
  description = "The ID of the subnets"
  type        = list(string)
}

variable "username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "The password for the database"
  type        = string
  default     = "air-sydney"
  sensitive   = true

}

variable "vpc_security_group_ids" {
  description = "The ID of the VPC security groups"
  type        = list(string)
}
