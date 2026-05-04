resource "aws_vpc" "main" {
    cidr_block = var.vpc_cider 
    enable_dns_hostnames = true
    tags = {
        Name = "${var.project_name}-vpc"
    }
}