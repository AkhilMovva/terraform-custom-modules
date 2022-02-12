resource "aws_lb" "alb_flask" {
  name               = "${var.environment}-alb-flask"
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_allow_http.id]
  subnets            = data.aws_subnet_ids.subnet_ids.ids
#   enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    "Name" = "${var.environment}-alb-flask"
  }
}

resource "aws_lb_target_group" "tg_flask" {
  name     = "${var.environment}-flask-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}


resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb_flask.arn
  port              = "5000"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_flask.arn
  }
}

resource "aws_lb_target_group_attachment" "tg_attach" {
  target_group_arn = aws_lb_target_group.tg_flask.arn
  target_id        = var.target_instance_id
  port             = 5000
}


resource "aws_security_group" "sg_allow_http" {
  name        = "sg_allow_http"
  description = "Allow HTTP inbound connections"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow HTTP Security Group"
  }
}

