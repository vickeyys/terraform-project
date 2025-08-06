resource "aws_instance" "nginx" {
  ami = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  user_data = var.user_data
  tags = var.ec2_tags
}