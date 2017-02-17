resource "aws_instance" "appserver01" {
  ami = "ami-c70525a1"
  instance_type = "t2.micro"
}
