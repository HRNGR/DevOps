terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.11.0"
    }
    github = {
      source = "integrations/github"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

provider "github" {
  # Configuration options
    token = "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"
}

resource "github_repository" "myrepo" {
    name = "librarianPro"
    auto_init = true
    visibility = "private"
}

resource "github_branch_default" "main" {
  branch = "main"
  repository = github_repository.myrepo.name
}

variable "files" {
  default = ["LibrarianPro.py", "requirements.txt", "Dockerfile", "docker-compose.yml"]
}

resource "github_repository_file" "app-files" {
  for_each = toset(var.files)
  content = file(each.value)
  file = each.value
  repository = github_repository.myrepo.name
  branch = "main"
  commit_message = "managed by HRN by terraform"
  overwrite_on_create = true
}

resource "aws_instance" "tf-librarian-ec2" {
  ami = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  key_name = "FirstKey"
  security_groups = ["tf-librarian-sec-gr"]
  tags = {
    Name = "Web Server of LibrarianPro"
  }
  user_data = <<-EOF
          #! /bin/bash

          yum update -y
          amazon-linux-extras install docker -y
          systemctl start docker
          systemctl enable docker
          usermod -a -G docker ec2-user
          newgrp docker
          curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
          -o /usr/local/bin/docker-compose
          chmod +x /usr/local/bin/docker-compose
          mkdir -p /home/ec2-user/librarian-api
          TOKEN="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"
          FOLDER="https://$TOKEN@raw.githubusercontent.com/HRNGR/librarianPro/main/"
          curl -s --create-dirs -o "/home/ec2-user/librarian-api/app.py" -L "$FOLDER"LibrarianPro.py
          curl -s --create-dirs -o "/home/ec2-user/librarian-api/requirements.txt" -L "$FOLDER"requirements.txt
          curl -s --create-dirs -o "/home/ec2-user/librarian-api/Dockerfile" -L "$FOLDER"Dockerfile
          curl -s --create-dirs -o "/home/ec2-user/librarian-api/docker-compose.yml" -L "$FOLDER"docker-compose.yml
          cd /home/ec2-user/librarian-api
          docker build -t hrngr/librarianapi:latest .
          docker-compose up -d
          EOF

  depends_on = [github_repository.myrepo, github_repository_file.app-files]
}

resource "aws_security_group" "tf-librarian-sec-gr" {
  name = "tf-librarian-sec-gr"
  tags = {
    Name = "tf-librarian-sec-gr"
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "website" {
  value = "http://${aws_instance.tf-librarian-ec2.public_dns}"
}