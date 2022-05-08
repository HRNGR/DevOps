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

data "aws_ami" "my_ami" {
  most_recent = true
  owners = ["amazon"]
}

resource "aws_instance" "hw-ec2" {
  ami = ""
  instance_type = "t2.micro"
  key_name = "FirstKey"
  security_groups = ["hw-sg"]
  count = 2
    tags = {
      "Name" = "Terraform ${element(var.hw_tags, count.index)} instance"
  }
}


resource "aws_security_group" "hw-sg" {
  name = "hw-sg"
    tags = {
    Name = "hw-sg"
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






