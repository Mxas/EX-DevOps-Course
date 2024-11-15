variable "profile" {
  description = "AWS Profile to use."
  type        = string
}

variable "region" {
  description = "AWS Region name"
  type        = string
  default     = "eu-central-1"
}


variable "vpc-id" {
  description = "AWS VPC ID"
  type        = string
}

variable "aws-ami-name-filter-ubuntu" {
  description = "AWS AMI Name Filter for Ubuntu"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}

variable "aws-ami-name-filter-linux" {
  description = "AWS AMI Name Filter for Linux"
  type        = string
  default     = "al2023-ami-2023.5.20241001.1-kernel-6.1-x86_64*"
}

variable "instance-type" {
  description = "Instance type"
  type        = string
  default     = "t3a.medium"
  # default     = "t2.micro"
}

variable "subnet-id" {
  description = "Subnet ID for spinning up AWS EC2 instance."
  type        = string
}

variable "keypair" {
  description = "AWS Keypair"
  type        = string
}

variable "key-path" {
  description = "AWS Key Path"
  type        = string
}


variable "my-public-ip" {
  description = "My current public IP address"
  type        = string
}

