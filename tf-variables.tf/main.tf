terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"  # Specify the AWS provider version to ensure compatibility
    }
  }
}

provider "aws" {
  # AWS provider configuration (region, credentials can be set via environment variables or shared credentials file)
}

# Define local variables for consistent naming
locals {
  owner = "kartik"  # Owner tag for resource tracking
  name  = "myserver"  # Name of the EC2 instance
}

resource "aws_instance" "myserver" {
  ami           = var.ami  # AMI ID for the EC2 instance, passed as a variable
  instance_type = var.instance_type  # Instance type (e.g., t2.micro, t3.medium)

  # Configure root volume settings
  root_block_device {
    delete_on_termination = true  # Ensures the volume is deleted when the instance is terminated
    volume_size           = var.root_block_device.volume_size  # Define the volume size via variable
    volume_type           = var.root_block_device.volume_type  # Define the volume type (e.g., gp3, io1)
  }

  # Define instance tags by merging additional tags with predefined ones
  tags = merge(var.additional_tags, {
    Name = local.name  # Set the Name tag using local variable
  })
}
