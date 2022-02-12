variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
}

variable "availability_zones" {
  type        = list(any)
  description = "List of availability zones for each subnet"
 
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "List of CIDR blocks assigned to public subnets"
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "List of CIDR blocks assigned to private subnets"
}

variable "tags" {
  type        = map(any)
  description = "Map of tags passed to the module"
  default     = {}
}

variable "environment" {
  type        = string
  description = "Environment"
  # default     = "dev"    
}

variable "project" {
  type        = string
  description = "project"
  default     = "flask-app"    
}