provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

data "aws_ami" "tf_ami" {
    most_recent = true
    owners = ["self"]
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
  
}

resource "aws_instance" "test" {
    ami = "data.aws_ami.tf_ami.id"
    instance_type = var.instance_type
    key_name      = var.key_name
    tags = {
        "Name"  = "testec2"
    }
  count = 2
}

