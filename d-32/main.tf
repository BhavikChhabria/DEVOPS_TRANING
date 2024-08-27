provider "aws" {
  region = "us-east-1"
}

variable "ami_id" {
  default = "ami-0e86e20dae9224db2"
}

variable "db_password" {
  type      = string
  sensitive = true
}
