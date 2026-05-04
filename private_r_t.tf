# 1. تعريف الجدول وتوجيهه للـ NAT
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

# 2. ربط الـ Subnet الأولى (App) بالجدول
resource "aws_route_table_association" "app_assoc" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_rt.id
}

# 3. ربط الـ Subnet الثانية (Database) بالجدول
resource "aws_route_table_association" "db_assoc" {
  subnet_id      = aws_subnet.private_db.id
  route_table_id = aws_route_table.private_rt.id
}