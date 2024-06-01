resource "aws_route_table_association" "public_route_association" {
    count = length(var.public_subnets)
    depends_on = [ aws_subnet.public_subnet, aws_route_table.public_route ]
    subnet_id = element(aws_subnet.public_subnet[*].id, count.index)
    route_table_id = aws_route_table.public_route.id
  
}

resource "aws_route_table_association" "private_route_association" {
    count = length(var.private_subnets)
    route_table_id = aws_route_table.private_route[count.index].id
    depends_on = [ aws_subnet.private_subnet, aws_route_table.private_route ]
    subnet_id = element(aws_subnet.private_subnet[*].id, count.index)
}