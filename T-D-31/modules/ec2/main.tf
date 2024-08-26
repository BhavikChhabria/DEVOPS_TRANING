resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count
  subnet_id     = element(var.subnet_ids, count.index)
  key_name      = var.key_name

  tags = {
    Name = "EC2-instance-${count.index + 1}"
  }
}

output "instance_ids" {
  value = aws_instance.web[*].id
}
