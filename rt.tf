resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "public route"
    }
  
}

resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.vpc.id
    count = length(var.private_subnets)
    depends_on = [ aws_nat_gateway.ngw ]
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw[count.index].id
    }
    tags = {
      Name = "private route"
    }
  
}