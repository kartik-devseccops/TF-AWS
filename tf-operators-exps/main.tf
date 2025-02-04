// Number list
variable "num_list" {
  type = list(number)
  default = [ 1,2,3,4,5 ]
}

//Object list of person
variable "obj_list" {
  type = list(object({
    fname = string
    lname = string
  }))
  default = [ {
    fname = "kartik"
    lname = "kohapare"
  },
  {
    fname = "Raj"
    lname = "kumar"
  }]
}

// Map list
variable "map_list" {
    type = map(number)
    default = {
      "one" = 1
      "two" = 2
      "three"= 3
    }
  
}

locals {
  //double the list
  double = [for num in var.num_list: num * 2]

  // finding odd one 
  odd = [for num  in var.num_list : num if num % 2 != 0]

  // To get only firsname list
  f_name = [for person in var.obj_list: person.fname]
}
output "output" {
    value = local.f_name
}