resource "aws_eip" "eip" {
    vpc = true
    count = length(var.private_subnets)
}

resource "aws_nat_gateway" "ngw" {
    count = length(var.private_subnets)
    depends_on = [ aws_eip.eip ]
    allocation_id = aws_eip.eip[count.index].id
    subnet_id = aws_subnet.private_subnet[count.index].id
    tags = {
      Name = "NGW"
    }
}