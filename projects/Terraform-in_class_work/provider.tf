provider "aws" {
    region = "us-east-1"  
}

data "aws_ami" "tf_ami" {
  
}

terraform {
  requiried_providers {
      source  = "hasicorp/aws"
      version = "4.8.0"
  }
}
