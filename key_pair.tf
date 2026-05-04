resource "aws_key_pair" "main_key" {
  key_name   = "${var.project_name}-key"
  public_key = file("${path.module}/my-terraform-key.pub") # يقرأ الملف اللي لسه عاملينه
}