variable "environment" {
  type        = string
  description = "Environment"
  default     = "dev"
}
variable "project" {
  type        = string
  description = "Project"
  default     = "flask"
}
variable "region" {
  type        = string
  description = "region"
  default     = "us-east-1"
}

# vpc variables
variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  type        = list(any)
  description = "List of availability zones for each subnet"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "List of CIDR blocks assigned to public subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "List of CIDR blocks assigned to private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

#compute variables
variable "ami" {
  type        = string
  description = "AMI"
  default     = "ami-04505e74c0741db8d" #ubuntu
}

variable "instance_type" {
  type        = string
  description = "type of the instance"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "key pair name"
  default     = "ec2_ssh1"
}

#dns variables
variable "domain_name" {
  type        = string
  description = "domain name"
  default     = "akhilmovva.live"
}

#alb
variable "target_instance_id" {
    type= string
    description = "Public Subnet ID"
    default = "x"
}

variable "internal" {
    type= bool
    description = "expose to outside"
    default=false     
}

# launch configuration and Auto scaling group
variable "image_ami_id" {
    type= string
    description = "AMI"
    default="ami-04505e74c0741db8d" #ubuntu
}

# Auto Scaling Group
variable "desired_capacity" {
    type= string
    description = "desired capacity"
    default = "2"
}
variable "max_size" {
    type= string
    description = "max size"
    default = "3"
}
variable "min_size" {
    type= string
    description = "min size"
    default = "2"
}    
variable "health_check_type" {
    type= string
    description = "health check type"
    default = "EC2"
} 