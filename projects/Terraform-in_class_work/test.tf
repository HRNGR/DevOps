

data "aws_ami" "tf_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


resource "aws_instance" "tf-ec2" {
  ami             = data.aws_ami.tf_ami.id
  count           = var.num_of_instance
  instance_type   = var.ec2_type
  key_name        = var.keyname
  security_groups = ["tf-intance-sg"]


