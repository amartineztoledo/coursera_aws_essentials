variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "vpc_public_subnets" {
  description = "VPC public subnets"
  type = list(string)
}

variable "s3_dynamodb_profile_name" {
  description = "S3 DynamoDB profile name"
  type = string
}

variable "app_bucket_bucket" {
  description = "Application Bucket"
  type = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "load_balancer_sg_id" {
  description = "Load Balancer Security Group Id"
  type = string
}

variable "ssh_key_pair_name" {
  description = "SSH key pair name"
  type = string
}

variable "ssh_key_pair_public_key_path" {
  description = "SSH key pair public key"
  type = string
}

variable "security_group_name" {
  description = "Security Group Name"
  type = string
}

variable "security_group_description" {
  description = "Security Group Description"
  type = string
}

variable "app_launch_template_name" {
  description = "Application Launch Template Name"
  type = string
}

variable "app_launch_template_image_id" {
  description = "Application Launch Template Image ID"
  type = string
}

variable "app_launch_template_instance_type" {
  description = "Application Launch Template Instance Type"
  type = string
}
