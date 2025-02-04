terraform {
  
}
locals {
  value = "kartik kohapare"
}
variable "string_list" {
  type = list(string)
  default = [ "serv1", "serv2", "serv3" ]
}

output "output" {
#   value = upper(local.value)
#   value = startswith(local.value,"kartik")
#   value = split(" ",local.value) 
#   value = min(1,2,3,4,5)
#   value = abs(-55)
#   value = join(":",var.string_list)
     value = contains(var.string_list,"serv1")
}