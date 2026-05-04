resource "aws_security_group" "bastion_sg" {
    name        = "${var.project_name}-bastion-sg"
    description = "Security group for bastion host" # Allow SSH access from anywhere
    vpc_id      = aws_vpc.main.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress { # Allow all outbound traffic
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # Allow all outbound traffic
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-bastion-sg"
    }
}