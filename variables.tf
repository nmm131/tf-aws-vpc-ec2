variable "region" {
  type    = string
  default = "us-west-1"
}

variable "vpc_id" {
  description = "IBM Cloud API Key"
  type        = string
}

variable "ami_id" {
  description = "IBM Cloud API Key"
  type        = string
}

variable "username" {
  description = "Location name for resource naming"
  type        = string
  default     = "sydney"
}

variable "password" {
  description = "Project name prefix for resources"
  type        = string
  default     = "air-sydney"
}
