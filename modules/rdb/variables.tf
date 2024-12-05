variable "subnet_ids" {
  description = "IBM Cloud zone"
  type        = list(string)
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

variable "vpc_security_group_ids" {
  description = "IBM Cloud region"
  type        = list(string)
}
