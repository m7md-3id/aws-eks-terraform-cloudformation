variable "region" {
  default     = "eu-central-1"
  description = "AWS region"
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name                 = "eks-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["eu-central-1a"]
  private_subnets      = ["10.0.1.0/24"]
  public_subnets       = ["10.0.2.0/24"]
  
  enable_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    Name = "EKS-VPC"
  }
}
