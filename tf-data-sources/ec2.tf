// AMI Id
data "aws_ami" "aws-ami" {
  most_recent = true
  owners      = ["amazon"]
}

// Security Group Id
data "aws_security_group" "name" {
  tags = {
    ENV  = "PROD"
    Name = "MySG"
  }
}

// VPC ID
data "aws_vpc" "name" {
  filter {
    name   = "vpc-id"
    values = ["vpc-087731fbee41a349a"]  # Replace with your actual VPC ID
  }
}


// Availability Zones
data "aws_availability_zones" "name" {}

// To get the account details
data "aws_caller_identity" "name" {}

// To get the region
data "aws_region" "name" {}

// Subnet ID
data "aws_subnet" "name" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.name.id]
  }
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_instance" "myserver" {
  ami             = data.aws_ami.aws-ami.id
  instance_type   = var.instance_type
  subnet_id       = data.aws_subnet.name.id
  security_groups = [data.aws_security_group.name.id]
  tags = {
    Name = var.name_tag
  }
}

// Outputs
output "aws_ami" {
  value = data.aws_ami.aws-ami.id
}

output "security_group_id" {
  value = data.aws_security_group.name.id
}

output "vpc_id" {
  value = data.aws_vpc.name.id
}

output "aws_zones" {
  value = data.aws_availability_zones.name.names
}

output "caller_info" {
  value = data.aws_caller_identity.name.account_id
}

output "region_name" {
  value = data.aws_region.name.name
}
