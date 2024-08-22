resource "aws_instance" "example" {
  ami           = " aws-ami-id" # Update with the correct AMI ID
  instance_type = var.instance_type
  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_s3_bucket" "example" {
  bucket_prefix = var.bucket_name
}
