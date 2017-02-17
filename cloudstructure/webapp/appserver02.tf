resource "aws_instance" "web" {
  ami = "ami-c70525a1"
  availability_zone= "eu-west-1"
  instance_type = "t2.micro"
  tags {
     Name = "appserver02"
  }
}


