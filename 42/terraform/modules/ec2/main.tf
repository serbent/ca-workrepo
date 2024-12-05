resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = var.security_groups
  subnet_id = var.subnet_id
  tags = {
    Name = var.instance_name
  }
}

resource "aws_lb_target_group_attachment" "ec_3" {
  target_group_arn = var.aws_lb_target_group
  target_id        = aws_instance.ec2_instance.id
  port             = 80
}