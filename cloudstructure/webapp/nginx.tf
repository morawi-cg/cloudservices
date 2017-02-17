resource "aws_instance" "web-server" {
  ami = "ami-ff022299"
  availability_zone = "eu-west-1"
  instance_type = "t2.micro"
  tags {
     Name = "NGINX"
  }
}

resource "aws_eip" "example" {
   vpc = true

}
