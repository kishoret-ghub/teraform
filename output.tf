output "instanc_id" {
    value = data.aws_ami.kishore.id
}

output "instanc_desc" {
    value = data.aws_ami.kishore.description
}

output "instanc_op" {
    value = aws_instance.web
}