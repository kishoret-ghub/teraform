resource "aws_instance" "web" {
  ami           = "ami-0e54eba7c51c234f6"
  count = length(var.instance_name)
  instance_type = var.instance_name[count.index] == "kishore" ? "t2.small" : "t2.medium"
  vpc_security_group_ids = [aws_security_group.TerraFormSG.id] 
  tags = {
      Name = var.instance_name[count.index]
      city = "TEXAS"
  }
}

resource "aws_route53_record" "www" {
  count = length(var.instance_name)
  zone_id = "Z071107613ZYKYO29V593"
  name    = "${var.instance_name[count.index]}"
  type    = "A"
  ttl     = 1
  records = [local.privateip]
}

resource "aws_security_group" "TerraFormSG" {
  name        = var.TerraFormSG
  description = "Allow TLS inbound traffic and all outbound traffic"
 # vpc_id      = aws_vpc.main.id

  tags = {
    Name = "TerraFormSG2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.TerraFormSG.id
  cidr_ipv4         = var.CIDR
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 0
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.TerraFormSG.id
  cidr_ipv4         = var.CIDR
  ip_protocol       = "-1" # semantically equivalent to all ports
}






