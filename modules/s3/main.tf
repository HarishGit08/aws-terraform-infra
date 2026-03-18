resource "aws_s3_bucket" "bucket" {
  bucket = "harish-terraform-bucket-2026-001"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}