resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project_name}-${var.stage}-vpc"
    Env     = var.stage
    Project = var.project_name
  }
}

resource "aws_subnet" "public_subnet_a" {
  count             = 1
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  availability_zone = "${var.aws_region}a"

  tags = {
    Name    = "${var.project_prefix}-${var.stage}-public-subnet-a"
    Env     = var.stage
    Project = var.project_name
  }
}

resource "aws_subnet" "public_subnet_c" {
  count             = 1
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 1)
  availability_zone = "${var.aws_region}c"

  tags = {
    Name    = "${var.project_prefix}-${var.stage}-public-subnet-c"
    Env     = var.stage
    Project = var.project_name
  }
}

resource "aws_subnet" "private_subnet_a" {
  count             = 1
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 2)
  availability_zone = "${var.aws_region}a"

  tags = {
    Name    = "${var.project_prefix}-${var.stage}-private-subnet-a"
    Env     = var.stage
    Project = var.project_name
  }
}

resource "aws_subnet" "private_subnet_c" {
  count             = 1
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 3)
  availability_zone = "${var.aws_region}c"

  tags = {
    Name    = "${var.project_prefix}-${var.stage}-private-subnet-c"
    Env     = var.stage
    Project = var.project_name
  }
}
