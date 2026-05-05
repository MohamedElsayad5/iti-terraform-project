resource "aws_instance" "app_server" {
    ami           = var.app_ami
    instance_type = var.app_instance_type
    subnet_id     = aws_subnet.private_1.id
    key_name = aws_key_pair.main_key.key_name
    vpc_security_group_ids = [aws_security_group.app_sg.id]
    tags = {
        Name = "${var.project_name}-app-server"
    }
  
}

resource "aws_lb_target_group_attachment" "app_attachment" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.app_server.id
  port             = 80
}