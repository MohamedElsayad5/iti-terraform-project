resource "aws_subnet" "private_db" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "${var.project_name}-private-db"
    }
}