
resource "aws_s3_bucket" "static" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "static" {
  bucket = aws_s3_bucket.static.id

  versioning_configuration {
    status = "Enabled"
  }
}
