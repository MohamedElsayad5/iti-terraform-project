data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"] # Canonical
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
  
}

resource "aws_instance" "bastion" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.bastion_instance_type
    subnet_id = aws_subnet.public_1.id
    key_name = aws_key_pair.main_key.key_name
    vpc_security_group_ids = [aws_security_group.bastion_sg.id]
    associate_public_ip_address = true
    tags = {
        Name = "${var.project_name}-bastion"
    }
  
}