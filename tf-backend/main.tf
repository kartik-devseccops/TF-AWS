terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "demo-bucket-e314530d47c9cce1"
    key = "backend.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "myserver" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.name_tag
  }
}
