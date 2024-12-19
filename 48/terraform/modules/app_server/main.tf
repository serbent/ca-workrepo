resource "aws_instance" "db_server" {
  ami           = var.ami
  instance_type = var.instance_type
#   key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name = "app_server"
  }
}