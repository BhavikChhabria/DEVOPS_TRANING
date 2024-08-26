variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}


variable "db_subnet_group" {
  description = "The name of the DB subnet group."
  type        = string
}

variable "db_sg" {
  description = "VPC security group IDs for the database"
  type        = list(string)
}
