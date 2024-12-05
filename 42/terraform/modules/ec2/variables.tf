variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "eu-cetral-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0b5673b5f6e8f7fa7" # Example: Amazon Linux 2
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "my-key-pair" # Replace with your key pair name
}

variable "vpc_id" {
  description = "VPC ID where the instance will be launched"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  default     = "basic-ec2"
}

variable security_groups {
  description = "security groups"
  type        = list(string)
}

variable aws_lb_target_group {
  type        = string
  default     = ""
  description = "AWS Target group arn"
}
