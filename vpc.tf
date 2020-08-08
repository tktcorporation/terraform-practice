variable "aws_region" {}

provider "aws" {
  version = "~> 3.1"
  region  = var.aws_region
}

variable "project_prefix" {}
variable "vpc_cidr" {}

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_prefix}-vpc"
  }
}
