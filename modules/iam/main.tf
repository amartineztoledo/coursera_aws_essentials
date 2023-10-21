# ===== Roles =====

resource "aws_iam_role" "s3_dynamodb_role" {
  name = var.s3_dynamodb_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "s3_dynamodb_profile" {
  name = var.s3_dynamodb_profile_name
  role = aws_iam_role.s3_dynamodb_role.name
}

# ==== Policies ====

resource "aws_iam_role_policy_attachment" "s3_full_access" {
  role = aws_iam_role.s3_dynamodb_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "dynamodb_full_access" {
  role = aws_iam_role.s3_dynamodb_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}
