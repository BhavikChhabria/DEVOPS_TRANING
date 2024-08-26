resource "aws_db_instance" "db" {
  allocated_storage       = 10
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = var.db_subnet_group
  vpc_security_group_ids  = var.db_sg

  skip_final_snapshot     = true
  storage_type            = "gp2"
  publicly_accessible     = false
  backup_retention_period = 7

  tags = {
    Name = "mydb-instance"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.db.endpoint
}
