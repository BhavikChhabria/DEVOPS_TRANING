variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "ssh_private_key" {
  description = "The private key to connect to the EC2 instance"
  type        = string
  sensitive   = true
}

variable "instance_name" {
  description = "The name tag for the EC2 instance"
  type        = string
}

variable "environment" {
  description = "The environment tag for the resources"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
