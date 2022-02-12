variable "vpc_id" {
    type= string
    description = "VPC ID"
}

variable "subnet_id" {
    type= string
    description = "Public Subnet ID"
}

variable "ami" {
    type= string
    description = "AMI"
    # default="ami-04505e74c0741db8d" #ubuntu
}

variable "instance_type" {
    type= string
    description = "type of the instance"
    # default="t2.micro" 
}

variable "key_name" {
    type= string
    description = "key pair name"
    # default="ec2_ssh1" 
}

variable "environment" {
    type= string
    description = "environment"
    # default="dev"     
}