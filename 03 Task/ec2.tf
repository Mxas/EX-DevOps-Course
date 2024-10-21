resource "aws_instance" "Instance-Ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance-type
  subnet_id     = var.subnet-id
  key_name      = var.keypair
  security_groups = [aws_security_group.EC2-SG-Instance-Ubuntu.id]
  user_data_replace_on_change = true
  user_data = file("./scripts/ubuntu-user-data.sh")
  tags = {
    Name = "Instance-Ubuntu"
  }
  provisioner "file" {
    source      = "./files"
    destination = "files"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.key-path)
      host        = self.public_dns
    }
  }
}
