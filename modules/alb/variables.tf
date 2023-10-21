variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "vpc_public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "load_balancer_sg_name" {
  description = "The name of the security group for the load balancer"
  type        = string
}

variable "load_balancer_target_group_name" {
  description = "The name of the target group for the load balancer"
  type        = string
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}
