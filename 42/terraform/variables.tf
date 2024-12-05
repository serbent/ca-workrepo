variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_a" {
  description = "CIDR block for the Subnet"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_b" {
  description = "CIDR block for the Subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone_a" {
  description = "Availability zone for the Subnet"
  default     = "eu-central-1a"
}

variable "availability_zone_b" {
  description = "Availability zone for the Subnet"
  default     = "eu-central-1b"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for storing Terraform state"
  default     = "caaws-tfstate-1eltbaemi6pv7wm"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking"
  default     = "terraform-state-locks"
}
