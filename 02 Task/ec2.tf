# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "Instance-A-Linux" {
  ami           = data.aws_ami.linux.id
  instance_type = var.instance-type
  subnet_id     = var.subnet-id
  key_name      = var.keypair
  security_groups = [aws_security_group.EC2-SG-Instance-A.id]
  associate_public_ip_address = false
  tags = {
    Name = "Instance-A-Linux"
  }
}

resource "aws_instance" "Instance-B-Ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "${var.instance-type}"
  subnet_id     = "${var.subnet-id}"
  key_name      = "${var.keypair}"
  security_groups = [aws_security_group.EC2-SG-Instance-B.id]
  user_data_replace_on_change = true
  user_data = file("./scripts/ubuntu-user-data.sh")
  tags = {
    Name = "Instance-B-Ubuntu"
  }
}
