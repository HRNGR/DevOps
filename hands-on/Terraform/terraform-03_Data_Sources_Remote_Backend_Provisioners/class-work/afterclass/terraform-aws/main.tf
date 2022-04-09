terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
  backend "s3" {
    bucket = "tf-remote-s3-bucket-hrn-changehere"
    key = "env/dev/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}

output "s3-arn-1" {
  value = aws_s3_bucket.tf-s3["fredo"].arn
  }