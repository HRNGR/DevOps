variable "vpc_id" {
  default = "vpc-0d201a8260f522c8e"
}
variable "keyname" {
  default = "FirstKey"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "aws_hosted_zone.domain_name" {
  default = "harungur.com"
}