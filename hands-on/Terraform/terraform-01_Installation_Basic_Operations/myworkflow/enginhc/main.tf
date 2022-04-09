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

resource "aws_instance" "test" {
    ami = "ami-0742b4e673072066f"
    instance_type = var.ec2_type
    key_name      = "FirstKey"
    tags = {
        Name  = "testec2"
    }
  count = 2
}