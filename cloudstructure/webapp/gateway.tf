resource "aws_internet_gateway" "gw" {
  vpc_id ="vpc-8b8fb0ef"
}

resource "aws_instance" "cloudservices" {  
   
  depends_on = ["aws_internet_gateway.gw"]
  ami = "ami-aec9e9dd"
  instance_type = "t2.micro"
  tags { 
    Name = "cloudservices-vpc"
  }  
}
