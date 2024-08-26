variable "ami_id" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for EC2 instances"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs"
  type        = list(string)
}

variable "instance_count" {
  description = "The number of instances to create"
  type        = number
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
}
