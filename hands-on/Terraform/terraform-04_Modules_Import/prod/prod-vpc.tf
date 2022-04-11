module "tf-vpc" {
  source = "../modules"
  environment = "PROD"
}

output "vpc-cidr-block" {
  values = ["module.tf-vpc.vpc_cidr"]
}