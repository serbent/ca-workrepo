provider "aws" {
  region = "eu-central-1"
}

# VPC
resource "aws_vpc" "example_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id

  tags = {
    Name = "example-internet-gateway"
  }
}

# Route Table
resource "aws_route_table" "example_public_rt" {
  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }

  tags = {
    Name = "example-public-route-table"
  }
}

# Public Subnet
resource "aws_subnet" "example_public_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "example-public-subnet"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "example_public_rt_association" {
  subnet_id      = aws_subnet.example_public_subnet.id
  route_table_id = aws_route_table.example_public_rt.id
}

# Security Group to Allow SSH Access
resource "aws_security_group" "ec2_security_group" {
  name_prefix = "ec2-security-group-"
  vpc_id      = aws_vpc.example_vpc.id

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Adjust to restrict access
  }
  ingress {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Adjust to restrict access
  }

    ingress {
    description      = "Allow HTTP"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Adjust to restrict access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2 Security Group"
  }
}

# EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id # Replace with your AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example_public_subnet.id
  key_name      = var.key_pair_name # Replace with your existing key pair name
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  tags = {
    Name = "My EC2 Instance"
  }
}

