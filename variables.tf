variable "region" {
  type        = string
  description = "AWS Region."
  default = "us-east-1"
}
variable "ssh_key" {
  type        = string
  description = "ssh key"
  default = "controller"
  
}
variable "ami" {
  type        = string
  description = "ami"
  default = "ami-000a54989336780b5"
}
variable "name" {
  type        = string
  description = "EC2 Name."
  default = "test"
}
variable "ec2_type" {
  type        = string
  description = "EC2 Instance Type"
  default = "t4g.small"
}
variable "vpc_id" {
  type        = string
  description = "EC2 Secuity Group"
  default = "vpc-09ebf0e2cfffcf4aa"
}
