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

locals {
  mytag = "hrn"
}

resource "aws_instance" "tf-ec2" {
    ami = data.aws_ami.tf-ami.id
    key_name = var.key_name
    instance_type = var.instance_type
    tags = {
        Name = "${local.mytag}-this is from my-ami"
    }
}