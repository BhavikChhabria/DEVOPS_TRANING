provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_pair_name
  public_key = file(var.ssh_public_key) 
}


module "aws_infrastructure" {
  source          = "./modules/aws_infrastructure"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  key_pair_name   = aws_key_pair.my_key_pair.key_name
  instance_name   = var.instance_name
  bucket_name     = var.bucket_name
  environment     = terraform.workspace
  ssh_private_key = var.ssh_private_key
}


