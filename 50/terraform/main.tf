provider "aws" {
  region = "eu-central-1" # Replace with your preferred region
}

locals {
  instance_count = var.environment == "production" ? 3 : 1
  instance_types = {
    production  = "t3.large"
    development = "t2.micro"
  }
  environment_short_names = {
    "development" = "dev"
    "staging"     = "stage"
    "production"  = "prod"
  }

  short_environment = lookup(local.environment_short_names, var.environment, "unknown")
  selected_instance_type = lookup(local.instance_types, var.environment, "t2.micro")
}

module "aws_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.short_environment}-my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

module github_ec2{
source = "git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v5.7.1"
name = "${local.short_environment}-coudacademy-${count.index + 1}"
count = local.instance_count
  instance_type          = local.selected_instance_type
  key_name               = "caawsv1"
  monitoring             = true
  vpc_security_group_ids = [module.aws_vpc.default_security_group_id]
  subnet_id              = module.aws_vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

