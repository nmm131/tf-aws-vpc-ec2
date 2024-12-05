variable "security_groups" {
  description = "Location name for resource naming"
  type        = list(string)
  default     = "sydney"
}

variable "subnets" {
  description = "IBM Cloud zone"
  type        = list(string)
}

variable "vpc_id" {
  description = "IBM Cloud zone"
  type        = string
}
