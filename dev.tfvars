#generic variables
environment = "dev"
project     = "flask"
region      = "us-east-1"
#vpc variables
vpc_cidr_block       = "10.0.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b"]
public_subnets_cidr  = ["10.0.101.0/24", "10.0.102.0/24"]
private_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
#compute variables
ami           = "ami-04505e74c0741db8d" # ubuntu
instance_type = "t2.micro"
key_name      = "ec2_ssh1"
#dns variables
domain_name = "akhilmovva.live"
#Application Load balncer
internal = false
#launch Configuration
image_ami_id = "ami-04505e74c0741db8d" # custom ami
#Auto Scaling Group
desired_capacity = "2"
max_size = "3"
min_size = "2"
health_check_type= "EC2"
