variable "region" {
  description = "Default Region"
  default = "us-east-1"
}
variable "ami" {
 description = "Ubuntu ami id"
 type = string
}
variable "instance_type" {
    description = "Instance type(eg. t2.micro, t3.large)"
    type = string
  
}
variable "name_tag" {
  description = "Name of EC2 instance"
  type = string
}