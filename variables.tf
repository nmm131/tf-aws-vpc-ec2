variable "region" {
  description = "The region"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "ami_id" {
  description = "The ID of the AMI"
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
