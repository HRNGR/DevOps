provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  tags = {
    Name = "terraform-vpc-${var.environment}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = var.public_cidr
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "privet_subnet" {
  vpc_id     = var.public_cidr
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "Main"
  }
}
