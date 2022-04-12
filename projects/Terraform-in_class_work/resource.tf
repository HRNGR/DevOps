resource "aws_security_group" "webserverSG" {
  name = "Web Server Sec Group"
  description = "Accepts HTTP and SSH Traffic"
  vpc = var.vpc_id #lookup(var.awsprops, "vpc_id")

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}