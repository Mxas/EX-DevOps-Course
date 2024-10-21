data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["${var.aws-ami-name-filter-ubuntu}"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}


data "aws_vpc" "main" {
  id = var.vpc-id
}

