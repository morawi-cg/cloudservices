resource "aws_security_group" "app" {
  name = "Security-Group-NGINX-Internal"
  description = "Firewall rules for the app server to the webserver "



  egress {
      from_port = 5000
      to_port = 80
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

