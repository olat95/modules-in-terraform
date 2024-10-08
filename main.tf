provider "aws" {
  region  = "eu-west-2"
  profile = "default"
}

# module for VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# module for EC2 instance

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name  = var.ec2_name
  count = 2

  instance_type          = var.ec2_instance
  monitoring             = true
  vpc_security_group_ids = module.vpc.default_security_group_id
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}