resource "aws_autoscaling_group" "flask-asg" {
  name                      = "${var.environment}-flsk-asg"
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  health_check_type         = var.health_check_type
  
  force_delete              = true

  launch_configuration      = aws_launch_configuration.lc_flask.name
  vpc_zone_identifier       =  data.aws_subnet_ids.subnet_ids.ids
#   vpc_zone_identifier       = [aws_subnet.example1.id, aws_subnet.example2.id]
#   enabled_metrics = [
#     "GroupMinSize",
#     "GroupMaxSize",
#     "GroupDesiredCapacity",
#     "GroupInServiceInstances",
#     "GroupTotalInstances"
#   ]
#   metrics_granularity = "1Minute"
#   tags {
#       key = "Name"
#       value = "ec2 instance"
#       propagate_at_launch = true
#   }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.flask-asg.id
  alb_target_group_arn   = aws_lb_target_group.tg_flask.arn
}

resource "aws_launch_configuration" "lc_flask" {
  name_prefix = "${var.environment}-flask-"

  image_id = var.image_ami_id # custom ami
  instance_type = var.instance_type
  key_name = var.key_name

  security_groups = [aws_security_group.asg_sg.id]
  associate_public_ip_address = true

# Required to redeploy without an outage.
#   lifecycle {
#     create_before_destroy = true
#   }
}



resource "aws_security_group" "asg_sg" {
  name        = "${var.environment}-asg-sg"
  description = "asg secgrp"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "asg_sg"
  }

}
