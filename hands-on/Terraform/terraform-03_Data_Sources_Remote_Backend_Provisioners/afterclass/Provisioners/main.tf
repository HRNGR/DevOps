terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name = "oliver"
  security_groups = ["tf-provisioner-sg"]
  tags = {
    Name = "terraform-instance-with-provisioner"
  }

    provisioner "lokal-exec" {
    command = "echo http://${self.public_ip}" > "public_ip.txt"
    }

    connection {
        type     = "ssh"
        user     = "ec2-user"
        private_key = file(""C:\\Users\\gurha\\Downloads\\FirstKey.pem"")
        host     = self.public_ip
    }
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd"
        ]
      }

    provisioner "file" {
    
    }




}
