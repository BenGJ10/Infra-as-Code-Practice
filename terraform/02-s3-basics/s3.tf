resource "random_id" "bucket_suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "demo-bucket-${random_id.bucket_suffix.hex}"
}

output "bucket_name" {
  value = aws_s3_bucket.demo_bucket.bucket
}