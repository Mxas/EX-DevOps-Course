output "Instance-Ubuntu-private-ip" {
  value = "${aws_instance.Instance-Ubuntu.private_ip}"
}

output "Instance-Ubuntu-public-ip" {
  value = "${aws_instance.Instance-Ubuntu.public_ip}"
}
