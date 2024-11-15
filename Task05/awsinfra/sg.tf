
resource "aws_security_group" "EC2-SG-Instance-Ubuntu" {
  name        = "EC2-SG-Instance-Ubuntu"
  description = "EC2 Testing for Instance-Ubuntu Ubuntu"
  vpc_id      = var.vpc-id

  tags = {
    Name = "EC2-SG-Instance-Ubuntu"
  }
}


resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-Ubuntu-ping" {
  security_group_id = aws_security_group.EC2-SG-Instance-Ubuntu.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-Ubuntu-ssh" {
  security_group_id = aws_security_group.EC2-SG-Instance-Ubuntu.id
  cidr_ipv4         = "${var.my-public-ip}/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-Ubuntu-https" {
  security_group_id = aws_security_group.EC2-SG-Instance-Ubuntu.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-Ubuntu-http" {
  security_group_id = aws_security_group.EC2-SG-Instance-Ubuntu.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-Ubuntu-http-8080" {
  security_group_id = aws_security_group.EC2-SG-Instance-Ubuntu.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}


resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-Ubuntu-http-8081" {
  security_group_id = aws_security_group.EC2-SG-Instance-Ubuntu.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8081
  ip_protocol       = "tcp"
  to_port           = 8081
}


resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-Ubuntu-http-30000" {
  security_group_id = aws_security_group.EC2-SG-Instance-Ubuntu.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 30000
  ip_protocol       = "tcp"
  to_port           = 30000
}


resource "aws_vpc_security_group_egress_rule" "EC2-SG-Instance-B-outgoing_all_in_vpc" {
  security_group_id = aws_security_group.EC2-SG-Instance-Ubuntu.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

