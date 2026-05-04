resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

resource "aws_route_table_association" "private-_1_assoc" {
    subnet_id = aws_subnet.private_1.id
    route_table_id = aws_route_table.private_rt.id
  
}