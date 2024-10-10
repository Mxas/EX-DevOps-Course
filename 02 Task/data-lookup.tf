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

  #   owners = ["099720109477"]
  owners = ["amazon"]
}


data "aws_ami" "linux" {
  most_recent = true

  filter {
    name = "name"
    values = ["${var.aws-ami-name-filter-linux}"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  #   owners = ["099720109477"]
  owners = ["amazon"]
}

data "aws_vpc" "main" {
  id = var.vpc-id
}

