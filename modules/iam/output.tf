output "s3_dynamodb_profile_name" {
  description = "S3 DynamoDB profile name"
  value = aws_iam_instance_profile.s3_dynamodb_profile.name
}

output "s3_dynamodb_role_name" {
  description = "S3 DynamoDB role name"
  value = aws_iam_role.s3_dynamodb_role.name
}
