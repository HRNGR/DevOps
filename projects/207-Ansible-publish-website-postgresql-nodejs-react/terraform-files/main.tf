//User needs to select appropriate key name and should put his/her own pem file in the relevant places when launching the template.

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # secret_key = ""
  # access_key = ""
}

variable "tags" {
  default = ["postgresql", "nodejs", "react"]
}
##keygen düzeltmeyi unutma
resource "aws_instance" "control_node" {
  ami = "ami-0f095f89ae15be883"
  instance_type = "t2.medium"
  key_name = "FirstKey"
  iam_instance_profile = aws_iam_instance_profile.ec2full.name
  vpc_security_group_ids = [aws_security_group.tf-sec-gr.id]
  tags = {
    Name = "ansible_control"
    stack = "ansible_project"
  }
}
resource "aws_instance" "managed_nodes" {
  ami = "ami-0f095f89ae15be883"
  count = 3
  instance_type = "t2.micro"
  key_name = "FirstKey"
  vpc_security_group_ids = [aws_security_group.tf-sec-gr.id]
  tags = {
    Name = "ansible_${element(var.tags, count.index )}"
    stack = "ansible_project"
    environment = "development"
  }
}

resource "aws_iam_role" "ec2full" {
  name = "projectec2full"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess"]   ## ec2fullaccess policy ile iam role oluşturduk
}

resource "aws_iam_instance_profile" "ec2full" {
  name = "projectec2full"
  role = aws_iam_role.ec2full.name
}

resource "aws_security_group" "tf-sec-gr" {
  name = "project207-sec-gr-FirstKey"
  tags = {
    Name = "project207-sec-gr-FirstKey"
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    protocol    = "tcp"
    to_port     = 5000
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    protocol    = "tcp"
    to_port     = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5432
    protocol    = "tcp"
    to_port     = 5432
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "null_resource" "config" {
  depends_on = [aws_instance.control_node]
  connection {
    host = aws_instance.control_node.public_ip
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/FirstKey.pem")
  }
## dosya kopyalama
  provisioner "file" {
    source = "./ansible.cfg"
    destination = "/home/ec2-user/ansible.cfg"
  }

  provisioner "file" {
    source = "./inventory_aws_ec2.yml"
    destination = "/home/ec2-user/inventory_aws_ec2.yml"
  }
## keygen kopyalama
  provisioner "file" {
    source = "~/.ssh/FirstKey.pem"
    destination = "/home/ec2-user/FirstKey.pem"
  }
## program kurma
  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname Ansible_control",
      "sudo yum install -y python3",
      "pip3 install --user ansible",
      "pip3 install --user boto3",
      "chmod 400 FirstKey.pem"
    ]
  }

}
## outputs
output "controlnodeip" {
  value = aws_instance.control_node.public_ip
}

output "privates" {
  value = aws_instance.control_node.*.private_ip
}