variable "region" {
  type        = string
  description = "AWS Region."
  default = "us-east-1"
}
variable "ssh_key" {
  type        = string
  description = "ssh key"
  default = "key-0825d3667ec688e9c"
  
}
variable "ami" {
  type        = string
  description = "ami-000a54989336780b5"
  default = "ami-000a54989336780b5"
}
variable "name" {
  type        = string
  description = "EC2 Name."
  default = "testwebapp"
}
variable "ec2_type" {
  type        = string
  description = "EC2 Instance Type"
  default = "t2.micro"
}
variable "vpc_id" {
  type        = string
  description = "EC2 Secuity Group"
  default = "vpc-09ebf0e2cfffcf4aa"
}
