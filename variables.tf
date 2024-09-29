variable "TerraFormSG" {
    type = string
    default = "TerraFormSG"
}
variable "CIDR" {
    default = "0.0.0.0/0"
}

variable "instance_type" {
    type = string
    default = "t3.small"
  
}



variable "instance_name" {
    type = list
    default = ["kishore","shalini","loukya","arjun"]
  
}