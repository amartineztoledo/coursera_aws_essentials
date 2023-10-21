resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_policy" "app_bucket_policy" {
  bucket = aws_s3_bucket.app_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowS3ReadAccess"
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_number}:role/${var.role_name}"
        }
        Action   = "s3:*"
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.app_bucket.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.app_bucket.bucket}/*"
        ]
      }
    ]
  })
}
