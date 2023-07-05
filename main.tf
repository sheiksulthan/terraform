provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_security_group" "test" {
  name        = "myapp"
  description = "To host Tomcat"
  vpc_id      = var.vpc_id
  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }
  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/24"]
  }
  tags = {
    Name = "test"
  }
}

resource "aws_instance" "test" {
  ami           = var.ami
  instance_type = var.ec2_type
  key_name = var.ssh_key
  vpc_security_group_ids = [aws_security_group.test.id]
  tags = {
    Name = var.name
  }
}
