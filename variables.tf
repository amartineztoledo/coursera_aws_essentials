variable "region" {
  description = "The AWS region"
  type = string
  default = "us-east-1"
}

variable "env" {
  description = "The environment, e.g. 'dev', 'staging', 'prod'"
  type = string
  default = "dev"
}

variable "account_number" {
  description = "AWS account number"
  type = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    Terrafom    = true
  }
}

# === VPC ===
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

# === IAM ===
variable "s3_dynamodb_role_name" {
  description = "The name of the role for allow full access to S3 and DynamoDB"
  type        = string
}

variable "s3_dynamodb_profile_name" {
  description = "The name of the instance profile for allow full access to S3 and DynamoDB"
  type        = string
}

# === S3 ===
variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

# === DynamoDB ===
variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

# === Load Balancer ===
variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "load_balancer_sg_name" {
  description = "The name of the security group for the load balancer"
  type        = string
}

variable "load_balancer_target_group_name" {
  description = "The name of the target group for the load balancer"
  type        = string
}

# === EC2 ===
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
  default = "t2.micro"
}

# === AutoScaling ===

variable "autoscaling_group_name" {
  description = "Autoscaling Group Name"
  type = string
}

variable "autoscaling_group_max_size" {
  description = "Autoscaling Group Max Size"
  type = number
}

variable "autoscaling_group_min_size" {
  description = "Autoscaling Group Min Size"
  type = number
}

variable "autoscaling_group_desired_capacity" {
  description = "Autoscaling Group Desired Capacity"
  type = number
}

variable "autoscaling_group_health_check_grace_period" {
  description = "Autoscaling Group Health Check Grace Period"
  type = number
}

variable "autoscaling_policy_name" {
  description = "Autoscaling Policy Name"
  type = string
}

variable "autoscaling_policy_target_value" {
  description = "Autoscaling Policy Target Value"
  type = number
}

variable "autoscaling_sns_topic_name" {
  description = "Autoscaling SNS Topic Name"
  type = string
}

variable "autoscaling_notifications" {
  description = "Autoscaling Notifications"
  type = list(string)
}

variable "autoscaling_notifications_email" {
  description = "The email address to send notifications to"
  type        = string
}
