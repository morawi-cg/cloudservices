resource "aws_security_group" "web_app" {
  name = "Security-Group-NGINX-External"
  description = "Firewall rules for the web server to App Servers."

  ingress { 
      from_port = 0
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 0
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 80
      to_port = 0
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }


}

