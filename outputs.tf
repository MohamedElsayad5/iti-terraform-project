output "bastion_public_ip" {
    value = aws_instance.bastion.public_ip
    description = "Public IP of the bastion host"
  
}
output "app_private_ip" {
    value = aws_instance.app_server.private_ip
    description = "Private IP of the application server"
  
}