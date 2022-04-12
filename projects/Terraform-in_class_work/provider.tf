provider "aws" {
    region = "us-east-1"  
}

terraform {
  requiried_providers {
      source  = "hasicorp/aws"
      version = "4.8.0"
  }
}
