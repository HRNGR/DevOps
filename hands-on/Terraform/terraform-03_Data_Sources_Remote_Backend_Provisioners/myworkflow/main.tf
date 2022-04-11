provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = var.public_cidr
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "Main"
  }
}