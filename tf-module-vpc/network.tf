provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "name" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"

  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.name.names
  public_subnets  = ["10.0.0.0/24"]
  private_subnets = ["10.0.0.0/24"]
  tags = {
    Name = "test-vpc-module"
  }
}


