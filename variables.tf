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
    type = map
    default = {
        "KT" = "t3.small"
        "ST" = "t2.small"
        "LT" = "t3.medium"
        "AT" = "t2.medium"
    }
}

