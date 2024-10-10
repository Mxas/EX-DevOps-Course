//
# output "aws_ami_ubuntu" {
#   description = "Ubuntu AMI ID"
#   value       = data.aws_ami.ubuntu.id
# }
#
# output "aws_ami_linux" {
#   description = "Linux AMI ID"
#   value       = data.aws_ami.linux.id
# }
#
#
# output "Instance-A-id" {
#   value = "${aws_instance.Instance-A-Linux.id}"
# }
#
# output "Instance-B-id" {
#   value = "${aws_instance.Instance-B-Ubuntu.id}"
# }


output "Instance-A-Linux-private-ip" {
  value = "${aws_instance.Instance-A-Linux.private_ip}"
}

output "Instance-B-Ubuntu-private-ip" {
  value = "${aws_instance.Instance-B-Ubuntu.private_ip}"
}

output "Instance-B-Ubuntu-public-ip" {
  value = "${aws_instance.Instance-B-Ubuntu.public_ip}"
}
