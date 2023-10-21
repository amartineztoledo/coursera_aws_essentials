variable "s3_dynamodb_role_name" {
  description = "The name of the role for allow full access to S3 and DynamoDB"
  type        = string
}

variable "s3_dynamodb_profile_name" {
  description = "The name of the instance profile for allow full access to S3 and DynamoDB"
  type        = string
}
