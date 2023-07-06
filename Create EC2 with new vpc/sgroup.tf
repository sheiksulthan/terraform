# Create Security Group for ec2
# terraform aws create security group

resource "aws_security_group" "SSH-security-group" {
name        = "Security Group for SSH"
description = "Enable SSH access on Port 22"
vpc_id      = aws_vpc.vpc.id
ingress {
description      = "SSH Access"
from_port        = 22
to_port          = 22
protocol         = "tcp"
cidr_blocks      = var.ssh-location
}
egress {
from_port        = 0
to_port          = 0
protocol         = "-1"
cidr_blocks      = ["0.0.0.0/0"]
}
tags   = {
Name = "Security Group for SSH"
}
}

# Create Security Group for the Web Server
# terraform aws create security group

resource "aws_security_group" "webserver-security-group" {
name        = "Web Server Security Group"
description = "Enable HTTP/HTTPS access on Port 80/443"
vpc_id      = aws_vpc.vpc.id
ingress {
description      = "HTTP/HTTPS Access"
from_port        = 80
to_port          = 80
protocol         = "tcp"
}
egress {
from_port        = 0
to_port          = 0
protocol         = "-1"
cidr_blocks      = ["0.0.0.0/0"]
}
tags   = {
Name = "Web Server Security Group"
}
}