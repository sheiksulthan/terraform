#Create a new EC2 launch configuration

resource "aws_instance" "ec2_public" {
ami                    = "ami-03e7d35abf8845efc"
instance_type               = var.instance_type
key_name                    = var.key_name
security_groups             = ["${aws_security_group.SSH-security-group.id}"]
subnet_id                   = "${aws_subnet.public-subnet.id}"
associate_public_ip_address = true
disable_api_termination		= false
lifecycle {
create_before_destroy = true
}
tags = {
"Name" = "EC2-Public"
}
}
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 10
  encrypted			= true

  tags = {
    Name = "ec2 public"
  }
}
#resource "aws_volume_attachment" "my ebs" {
# device_name = "/dev/xvda1"
#  volume_id   = aws_ebs_volume.example.id
# instance_id = aws_instance.ec2_public.id
#}
#Create a new EC2 launch configuration
resource "aws_instance" "ec2_private" {
ami                    = "ami-03e7d35abf8845efc"
instance_type               = var.instance_type
key_name                    = var.key_name
security_groups             = ["${aws_security_group.webserver-security-group.id}"]
subnet_id                   = "${aws_subnet.private-subnet.id}"
associate_public_ip_address = false
disable_api_termination		= false

#user_data                   = "${data.template_file.provision.rendered}"
#iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
lifecycle {
create_before_destroy = true
}
tags = {
"Name" = "EC2-Private"
}
}
resource "aws_ebs_volume" "example2" {
  availability_zone = "us-east-1b"
  size              = 10

  tags = {
    Name = "ec2 private"
  }
}
