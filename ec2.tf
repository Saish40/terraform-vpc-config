data "aws_subnet" "public_subnet" {
    filter {
      name = "tag:Name"
      values = ["public-subnet : 1"]
    }
  
}

resource "aws_instance" "ec2" {
    ami = "ami-0e001c9271cf7f3b9"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.sg.id ]
    subnet_id = data.aws_subnet.public_subnet.id
    tags = {
      Name = "EC2"
    }
  
}