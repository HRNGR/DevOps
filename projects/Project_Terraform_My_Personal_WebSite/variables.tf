variable "vpc_id" {
  default = "vpc-0d201a8260f522c8e"   #£ ID'yi kontrol et Default u silince değişiyor ID
}
variable "keyname" {
  default = "FirstKey"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "aws_route53_zone" {
  default = "harungur.com"
}