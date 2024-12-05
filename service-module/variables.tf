variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = "us-east"
}

variable "vpc_id" {
  description = "IBM Cloud API Key"
  type        = string
}


variable "subnet_id" {
  description = "IBM Cloud zone"
  type        = string
  default     = "us-east-1"
}

# Define subnets
variable "subnets" {
  type = list(object({
    name = string
    zone = string
    cidr = string
  }))
  description = "List of subnets to create in the VPC"
  default = [
    {
      name = "subnet-1-sydney"
      zone = "us-south-1"
      # cidr = "10.241.0.0/24" # us-east
      # cidr = "10.245.0.0/18" # au-syd
      cidr = "10.240.0.0/18" # us-south
    },
    {
      name = "subnet-2-sydney"
      zone = "us-south-2"
      # cidr = "10.241.64.0/24" # us-east
      # cidr = "10.245.64.0/18" # au-syd
      cidr = "10.240.64.0/18" # us-south
    },
    {
      name = "subnet-3-sydney"
      zone = "us-south-3"
      # cidr = "10.241.128.0/24" # us-east
      # cidr = "10.245.128.0/18" # au-syd
      cidr = "10.240.128.0/18" # us-south
    }
  ]
}

variable "db_username" {
  description = "Location name for resource naming"
  type        = string
  default     = "sydney"
}

variable "db_password" {
  description = "Project name prefix for resources"
  type        = string
  default     = "air-sydney"
}

variable "ami_id" {
  description = "Name of the SSH key in IBM Cloud"
  type        = string
  default     = "air-dev-sydney"
}

# variable "db_subnet_group_name" {
#   description = "ID of the image to use for instances"
#   type        = string
#   default     = "r026-9ff1f4c1-33f9-4edf-af20-82d1f52f9446"
# }