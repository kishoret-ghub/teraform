locals {
    privateip = "aws_instance.web[count.index].private_ip"
}