# Create VPC
# terraform aws create vpc

resource "aws_vpc" "vpc" {
cidr_block = var.vpc-cidr
instance_tenancy        = "default"
enable_dns_hostnames    = true
tags      = {
Name    = "Test_VPC"
}
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway

resource "aws_internet_gateway" "igw" {
vpc_id    = aws_vpc.vpc.id
tags = {
Name    = "igw"
}
}

# Create Public Subnet 1
# terraform aws create subnet

resource "aws_subnet" "public-subnet" {
vpc_id                  = aws_vpc.vpc.id
cidr_block              = var.Public_Subnet
availability_zone       = "us-east-1"
map_public_ip_on_launch = true
tags      = {
Name    = "public-subnet"
}
}

# Create Route Table and Add Public Route
# terraform aws create route table

resource "aws_route_table" "public-route-table" {
vpc_id       = aws_vpc.vpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}
tags       = {
Name     = "Public Route Table"
}
}

# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table

resource "aws_route_table_association" "public-subnet-route-table-association" {
subnet_id           = aws_subnet.public-subnet.id
route_table_id      = aws_route_table.public-route-table.id
}

# Create Private Subnet 1
# terraform aws create subnet

resource "aws_subnet" "private-subnet" {
vpc_id                   = aws_vpc.vpc.id
cidr_block               = var.Private_Subnet
availability_zone        = "us-east-1"
map_public_ip_on_launch  = false
tags      = {
Name    = "private-subnet"
}
}