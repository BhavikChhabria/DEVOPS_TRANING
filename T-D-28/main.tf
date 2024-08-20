# VPC Configuration
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Subnet Configuration
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

# Security Group Configuration
resource "aws_security_group" "web" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance Configuration
resource "aws_instance" "app" {
  ami             = "ami"  
#   instance_type = "t2.medium"  
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]  # Using Security Group ID

  tags = {
    Name = "AppServer"
  }
}

# RDS MySQL Instance Configuration
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"  # Ensure this version is supported in your region
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = true
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.web.id]  # Using Security Group ID
}

# S3 Bucket Configuration
resource "aws_s3_bucket" "static_assets" {
  bucket = "my-static-bucket-bhavik"  # Replace with a unique bucket name

  tags = {
    Name = "StaticAssetsBucket"
  }
}

# Random ID for S3 Bucket Suffix (Optional)
resource "random_id" "bucket_suffix" {
  byte_length = 8
}

