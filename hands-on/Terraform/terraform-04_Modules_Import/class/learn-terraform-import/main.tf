terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "natf-instance" {
  ami = ""
  instance_type = "t2.micro"
  count = 3
  key_name = "FirstKey"
  security_groups = ["tf-import-sg"]
  tags = {
    Name =
  }
  
}

resource "aws_security_group" "tf-sg" {
  name = "tf-import-sg"
  description = "terraform import-sg"
  tags = {
    Name = "tf-import-sg"
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