
variable "region" {
    description = "Region"
  default = "us-east-1"
}
variable "ami" {
  type        = string
  description = "ubuntu iam id"

}
variable "instance_type" {
  type        = string
  description = "instance type"
}
variable "name_tag" {
  type        = string
  description = "Name fo EC2 instance"
}
output "public_ip" {
  value       = aws_instance.myserver.public_ip
  description = "Public IP address of EC2 instance"
}
output "instance_id" {
  value       = aws_instance.myserver.id
  description = "Instance id"
}