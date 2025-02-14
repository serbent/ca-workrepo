module "aws_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev-my-vpc"
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
name = "dev-coudacademy-01"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  monitoring             = true
  associate_public_ip_address = true
  vpc_security_group_ids = [module.aws_vpc.default_security_group_id]
  subnet_id              = module.aws_vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}