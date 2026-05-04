# 1. حجز الـ Static IP للـ NAT Gateway
resource "aws_eip" "nat_eip" {
    domain = "vpc" 
    tags = {
        Name = "${var.project_name}-nat-eip"
    }
}

# 2. إنشاء الـ NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id     = aws_subnet.public_1.id # توضع دائماً في الـ Public Subnet
    
    # التصحيح هنا: الـ tags يجب أن تكون Map
    tags = {
        Name = "${var.project_name}-nat"
    }

    # نصيحة: تأكد من وجود الـ IGW قبل إنشاء الـ NAT
    depends_on = [aws_internet_gateway.main_igw] 
}