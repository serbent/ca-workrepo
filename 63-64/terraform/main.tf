module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "20.33.1"

    cluster_name = "ca-lesson-63-64"
    cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

    vpc_id     = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
    self_managed_node_groups = {
        calesson = {
            ami_type      = "AL2_x86_64"
            instance_type = "t2.micro"

            min_size = 2
            max_size = 5
            # This value is ignored after the initial creation
            # https://github.com/bryantbiggs/eks-desired-size-hack
            desired_size = 5
            }
  }
    cluster_endpoint_public_access = true
    enable_cluster_creator_admin_permissions = true
}



data "aws_availability_zones" "available" {
  # Exclude local zones
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

locals {
  name   = "ca-lesson-63-64"
  region = "eu-central-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-eks"
    GithubOrg  = "terraform-aws-modules"
  }
}

################################################################################
# VPC
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
  intra_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 52)]

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = local.tags
}
