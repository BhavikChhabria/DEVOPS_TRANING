variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
  default     = "us-west-1" 
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
}

variable "key_pair_name" {
  type        = string
  description = "The name for the key pair"
  default     = "key-pair"
}

variable "ssh_public_key" {
  type        = string
  description = "Path to the SSH public key"
  default     = "~/.ssh/key-pair.pub"
}

variable "ssh_private_key" {
  type        = string
  description = "Path to the SSH private key"
  default     = "~/.ssh/key-pair"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance"
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

