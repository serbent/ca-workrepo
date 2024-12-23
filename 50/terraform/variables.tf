variable "aws_region" {
  description = "AWS region"
  default     = "eu-central-1"
}

variable "db_username" {
  description = "Database username"
  default     = "admin"
#   sensitive   = true
}

variable "db_password" {
  description = "Database password"
#   sensitive   = true
}

variable "environment" {
  description = "Environment"
  default     = "development"
}