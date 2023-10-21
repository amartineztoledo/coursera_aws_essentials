output "app_bucket_bucket" {
  description = "App media files Bucket"
  value = aws_s3_bucket.app_bucket.bucket
}
