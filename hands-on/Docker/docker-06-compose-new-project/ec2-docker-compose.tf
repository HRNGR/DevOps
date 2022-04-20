//This Terraform Template creates 1 Docker Machines on EC2 Instances
//Docker-compose Machines will run on Amazon Linux 2 with custom security group
//allowing SSH (22) and HTTP (80) connections from anywhere.
//User needs to select appropriate key name when launching the instance.

# provider "aws" {
#   region = "us-east-1"
#   access_key = ""
#   secret_key = ""
#   //  If you have entered your credentials in AWS CLI before, you do not need to use these arguments.
# }

resource "aws_instance" "dockerserver" {
  ami           = "ami-03ededff12e34e59e"
  instance_type = "t2.micro"
  key_name      = "FirstKey"
  //  Write your pem file name
  vpc_security_group_ids = [aws_security_group.sec-gr.id]
  security_groups = ["docker_compose_sec_group"]
  tags = {
    Name = "docker_compose_instance_1"
  }
  user_data = <<-EOF
              #! /bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              systemctl start docker
              systemctl enable docker
              usermod -a -G docker ec2-user
              # install docker-compose
              curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" \
              -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose
              yum install git -y
              hostnamectl set-hostname "docker-compose-server"
              EOF
}

   // vpc_security_group_ids = [aws_security_group.sec-gr.id]

resource "aws_security_group" "docker_compose_sec_group" {
  name = "docker_compose_sec_group"
  tags = {
    Name = "docker_compose"
          }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    protocol    = "tcp"
    to_port     = 5000
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "docker-compose-public-ip" {
  value = aws_instance.dockerserver.public_ip
}