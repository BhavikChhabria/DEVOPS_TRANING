vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
instance_type      = "t2.micro"
instance_count     = 2
key_name           = "my-key-pair"
db_instance_class  = "db.t3.micro"
db_name            = "mydatabase"
db_username        = "admin"
db_password        = "db_123"
allocated_storage  = 20
bucket_name        = "my-static-files-bc"
role_name          = "ec2-role"
ami_id             = "ami"
region             = "us-west-1"
aws_profile        = "default"

