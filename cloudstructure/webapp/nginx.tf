resource "aws_instance" "nginx" {
  ami = "ami-ff022299"
  instance_type = "t2.micro"
}
