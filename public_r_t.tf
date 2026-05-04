resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main_igw.id 
}
tags = {
    Name = "${var.project_name}-public-rt"
  }
}
#associate the public route table with the public subnet
resource "aws_route_table_association" "public_1_assoc" {
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.public_rt.id
}