provider "aws" {
  version = "~> 3.1"
}

variable "project_prefix" {}
variable "vpc_cidr" {}

resource "aws_vpc" "${var.project_prefix}-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_prefix}"
  }
}
