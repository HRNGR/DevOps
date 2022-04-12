Terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        versions = "4.9.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "name" {
  name = "odev-sg"
    tags = {
    Name = "tf-sg"
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}






data "aws_ami" "my_ami" {
  most_recent = true
  owners = ["self"]

  filter {
    name = "name"
    values = ["myami-*"]
  }
}