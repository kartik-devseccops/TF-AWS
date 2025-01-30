# AMI ID variable to define the base image for the EC2 instance
variable "ami" {
  type    = string
  default = "ami-04b4f1a9cf54c11d0"  # Default AMI ID, update as needed
}

# Instance type variable with validation to allow only specific types
variable "instance_type" {
  description = "Type of EC2 instance you want to create"
  type        = string

  validation {
    condition     = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "Only t2 and t3 micro instance types are allowed"  # Restricts instance types
  }
}

# Grouping root block device configurations into a single object
variable "root_block_device" {
  type = object({
    volume_size = number  # Defines the volume size in GB
    volume_type = string  # Defines the volume type (e.g., gp2, gp3)
  })
  default = {
    volume_size = 20  # Default root volume size
    volume_type = "gp2"  # Default volume type (general-purpose SSD)
  }
}

# Additional tags to be applied to resources, defined in key-value pairs
variable "additional_tags" {
  type    = map(string)  # Expecting a key=value format for tags
  default = {}  # Default to an empty map (no additional tags)
}
