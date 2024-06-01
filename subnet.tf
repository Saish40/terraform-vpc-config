resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    count = length(var.public_subnets)
    cidr_block = element(var.public_subnets, count.index)
    tags = {
      Name = "public-subnet : ${count.index + 1}"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc.id
    count = length(var.private_subnets)
    cidr_block = element(var.private_subnets, count.index)
    tags = {
      Name = "private-subnet : ${count.index + 1}"
    }
}