terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
}

resource "aws_instance" "myserver" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.name_tag
  }
}
