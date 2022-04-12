resource "aws_security_group" "webserverSG" {
  name = "Web Server Sec Group"
  description = "Accepts HTTP and SSH Traffic"
  vpc = ""
}