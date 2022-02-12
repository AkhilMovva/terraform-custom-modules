module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  availability_zones   = var.availability_zones
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  environment          = var.environment
}

module "compute" {
  source        = "./modules/compute"
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  #   vpc_security_group_ids = module.vpc.vpc_id
  vpc_id      = module.vpc.vpc_id
  subnet_id   = module.vpc.subnet_ids[0]
  environment = var.environment
}

module "dns" {
  source      = "./modules/dns"
  domain_name = var.domain_name
  flask_ip    = module.compute.flask_vm_public_ip
  mysql_ip    = module.compute.mysql_vm_public_ip
  environment = var.environment
}

module "alb-asg" {
  source = "./modules/alb-asg"
  #App load balancer
  internal = var.internal
  vpc_id      = module.vpc.vpc_id
  target_instance_id = module.compute.flask_instance_id
  #launch Configuration
  image_ami_id = var.image_ami_id # custom ami
  instance_type = var.instance_type
  key_name = var.key_name
  #Auto Scaling Group
  desired_capacity=var.desired_capacity
  max_size=var.max_size
  min_size=var.min_size
  health_check_type=var.health_check_type
  environment = var.environment
}