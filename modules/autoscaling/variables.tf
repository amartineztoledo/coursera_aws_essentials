variable "app_launch_template_id" {
  description = "The ID of the launch template"
  type = string
}

variable "vpc_public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "app_target_group_arns" {
  description = "The ARN of the target group"
  type        = list(string)
}

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