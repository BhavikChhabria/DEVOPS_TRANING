module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "my-vpc"
  availability_zones = ["us-west-1a", "us-west-1b"]
  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
  private_subnet_cidrs = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]
}

module "ec2" {
  source         = "./modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_ids     = module.vpc.public_subnet_ids
  instance_count = 2
  key_name       = "my-key-pair"
}

module "rds" {
  source = "./modules/rds"
  db_name              = "mydatabase"
  db_username          = "admin"
  db_password          = "password123"
  db_subnet_group      = "my-db-subnet-group"
  db_sg                = ["sg-0123456789abcdef0"]
}


resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-rds-subnet-group"
  subnet_ids = module.vpc.private_subnet_ids
  description = "Subnet group for RDS"

  tags = {
    Name = "my-rds-subnet-group"
  }
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-static-files-bc"  # Ensure this bucket name is valid
}

module "iam" {
  source    = "./modules/iam"
  role_name = "ec2_role"
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}
