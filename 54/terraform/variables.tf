# Variables
variable "vpc_id" {
  description = "The ID of the existing VPC where the instance will be created"
  default = ""
}

variable "subnet_id" {
  description = "The ID of the existing Subnet where the instance will be created"
  default = ""
}

variable "key_pair_name" {
  description = "The name of the existing key pair for SSH access"
}

variable "instance_type" {
  default     = "t2.micro" # Default instance type
  description = "The type of EC2 instance to create"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
}