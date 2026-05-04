resource "aws_instance" "db_server" {
  count                  = 2
  ami                    = var.app_ami
  instance_type          = var.app_instance_type
  subnet_id              = aws_subnet.private_db.id
  vpc_security_group_ids = [aws_security_group.db_sg.id] # تأكد إنك كريت sg_db.tf
  key_name               = aws_key_pair.main_key.key_name

  tags = {
    Name = "${var.project_name}-db-${count.index == 0 ? "mysql" : "redis"}"
  }
}