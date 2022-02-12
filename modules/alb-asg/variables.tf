variable "vpc_id" {
    type= string
    description = "VPC ID"
}

variable "target_instance_id" {
    type= string
    description = "Public Subnet ID"
}

variable "internal" {
    type= bool
    description = "expose to outside"
    default=false     
}

variable "environment" {
    type= string
    description = "environment"
    # default="dev"     
}

# launch configuration and Auto scaling group
variable "image_ami_id" {
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

# Auto Scaling Group
variable "desired_capacity" {
    type= string
    description = "desired capacity"
    # default = "2"
}
variable "max_size" {
    type= string
    description = "max size"
    # default = "3"
}
variable "min_size" {
    type= string
    description = "min size"
    # default = "2"
}    
variable "health_check_type" {
    type= string
    description = "health check type"
    # default = "ELB"
} 

