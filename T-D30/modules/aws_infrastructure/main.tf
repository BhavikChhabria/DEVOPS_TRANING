resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = var.ssh_private_key  # Pass the private key directly
      host        = self.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }

  provisioner "local-exec" {
    command = "echo EC2 instance successfully provisioned with Apache at ${self.public_ip}"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

# output "instance_public_ip" {
#   value = aws_instance.ec2_instance.public_ip
# }

# output "s3_bucket_arn" {
#   value = aws_s3_bucket.bucket.arn
# }
