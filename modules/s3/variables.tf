variable "account_number" {
  description = "AWS account number"
  type = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type = string
}

variable "role_name" {
  description = "The name of the role"
  type = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
