variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_access_key" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "db_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
