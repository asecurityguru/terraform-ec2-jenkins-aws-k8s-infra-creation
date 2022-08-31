variable "aws_region" {
  description = "AWS region to create resources"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC for Jenkins"
}

variable "cidr_block" {
  description = "CIDR Block to allow Jenkins Access"
}

variable "key_name" {
  description = "Name of keypair to ssh"
}
