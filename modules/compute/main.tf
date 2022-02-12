resource "aws_instance" "flask_host" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids =  [aws_security_group.sg_flask.id]
  subnet_id              = var.subnet_id
  user_data              = file("${path.module}/host_data.sh")
  tags = {
    "Name" = "${var.environment}-flask-host"
  }
}

resource "aws_instance" "mysql_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids =  [aws_security_group.sg_mysql.id]
  subnet_id              = var.subnet_id
  user_data              = file("${path.module}/mysql_data.sh")
  tags = {
    "Name" = "${var.environment}-mysql-server"
  }
}

resource "aws_security_group" "sg_flask" {
  name        = "${var.environment}-sg-flask"
  description = "Allow SSH and flask inbound traffic"
  vpc_id      = var.vpc_id

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

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-sg-flask"
  }
}

resource "aws_security_group" "sg_mysql" {
  name        = "${var.environment}-sg-mysql"
  description = "Allow SSH and mysql inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-sg-mysql"
  }
}