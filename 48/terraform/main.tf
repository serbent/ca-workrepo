provider "aws" {
  region = "eu-central-1" # Replace with your preferred region
}

module "aws_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "app_server" {
  source = "./modules/app_server"
  #   iam_instance_profile              = module.iam_instance_profile.iam_instance_profile_name
  # key_name                        = module.key_pair.key_name
  security_group_id = module.aws_vpc.default_security_group_id
  subnet_id         = module.aws_vpc.public_subnets[0]
  ami               = "ami-0e54671bdf3c8ed8d"
  instance_type     = "t2.micro"
}

module github_ec2{
source = "git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v5.7.1"
name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

