# https://github.com/Mxas/EX-DevOps-Course/blob/main/01%20Task%2FREADME-OPT.md
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "EC2-SG-Instance-A" {
  name        = "EC2-SG-Instance-A"
  description = "EC2 Testing for Instance-A Linux"
  vpc_id      = var.vpc-id

  tags = {
    Name = "EC2-SG-Instance-A"
  }
}


resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-A-ping" {
  security_group_id = aws_security_group.EC2-SG-Instance-A.id
#   cidr_ipv4         = data.aws_vpc.main.cidr_block
  referenced_security_group_id  = aws_security_group.EC2-SG-Instance-B.id
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-A-ssh" {
  security_group_id = aws_security_group.EC2-SG-Instance-A.id
#   cidr_ipv4         = data.aws_vpc.main.cidr_block
  referenced_security_group_id  = aws_security_group.EC2-SG-Instance-B.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-A-https" {
  security_group_id = aws_security_group.EC2-SG-Instance-A.id
#   cidr_ipv4         = data.aws_vpc.main.cidr_block
  referenced_security_group_id  = aws_security_group.EC2-SG-Instance-B.id
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-A-http" {
  security_group_id = aws_security_group.EC2-SG-Instance-A.id
#   cidr_ipv4         = data.aws_vpc.main.cidr_block
  referenced_security_group_id  = aws_security_group.EC2-SG-Instance-B.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "EC2-SG-Instance-A-outgoing_all_in_vpc" {
  security_group_id = aws_security_group.EC2-SG-Instance-A.id
#   cidr_ipv4         = data.aws_vpc.main.cidr_block
  referenced_security_group_id  = aws_security_group.EC2-SG-Instance-B.id
  ip_protocol       = "-1" # semantically equivalent to all ports
}



#
#
#

resource "aws_security_group" "EC2-SG-Instance-B" {
  name        = "EC2-SG-Instance-B"
  description = "EC2 Testing for Instance-B Ubuntu"
  vpc_id      = var.vpc-id

  tags = {
    Name = "EC2-SG-Instance-B"
  }
}


resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-B-ping" {
  security_group_id = aws_security_group.EC2-SG-Instance-B.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-B-ssh" {
  security_group_id = aws_security_group.EC2-SG-Instance-B.id
  cidr_ipv4         = "${var.my-public-ip}/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-B-https" {
  security_group_id = aws_security_group.EC2-SG-Instance-B.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-B-http" {
  security_group_id = aws_security_group.EC2-SG-Instance-B.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-B-proxy" {
  security_group_id = aws_security_group.EC2-SG-Instance-B.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3128
  ip_protocol       = "tcp"
  to_port           = 3128
}

resource "aws_vpc_security_group_egress_rule" "EC2-SG-Instance-B-outgoing_all_in_vpc" {
  security_group_id = aws_security_group.EC2-SG-Instance-B.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

