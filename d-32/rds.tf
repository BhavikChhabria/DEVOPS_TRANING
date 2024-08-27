resource "aws_db_subnet_group" "bhavik_db_subnet_group" {
  name       = "bhavik-db-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
  tags = {
    Name = "bhavik-db-subnet-group"
  }
}

resource "aws_db_instance" "bhavik_rds" {
  identifier           = "bhavik-rds"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.bhavik_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot  = true

  tags = {
    Name = "bhavik-rds"
  }
}
