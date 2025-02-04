
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
  description = "EC2 instance type"
}
variable "name_tag" {
  type        = string
  description = "Name fo EC2 instance"
}