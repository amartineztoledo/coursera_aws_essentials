provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  name = "${var.vpc_name}-${var.env}"
  cidr = var.vpc_cidr
  azs = var.vpc_azs
  public_subnets = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets
  tags = var.common_tags
}

module "s3" {
  source = "./modules/s3"
  account_number = var.account_number
  bucket_name = "${var.s3_bucket_name}-${var.env}"
  role_name = "${var.s3_dynamodb_role_name}-${var.env}"
  tags = var.common_tags
}

module "iam" {
  source = "./modules/iam"
  s3_dynamodb_role_name = "${var.s3_dynamodb_role_name}-${var.env}"
  s3_dynamodb_profile_name = "${var.s3_dynamodb_profile_name}-${var.env}"
}

module "dynamodb" {
  source = "./modules/dynamodb"
  table_name = "${var.dynamodb_table_name}"
  tags = var.common_tags
}

module "alb" {
  source = "./modules/alb"
  common_tags = var.common_tags
  vpc_id = module.vpc.vpc_id
  vpc_public_subnets = module.vpc.vpc_public_subnets
  load_balancer_name = "${var.load_balancer_name}-${var.env}"
  load_balancer_sg_name = "${var.load_balancer_sg_name}-${var.env}"
  load_balancer_target_group_name = "${var.load_balancer_target_group_name}-${var.env}"
}

module "ec2" {
  source = "./modules/ec2"
  ssh_key_pair_name = "${var.ssh_key_pair_name}-${var.env}"
  ssh_key_pair_public_key_path = var.ssh_key_pair_public_key_path
  security_group_name = "${var.security_group_name}-${var.env}"
  security_group_description = "${var.security_group_description}"
  vpc_id = module.vpc.vpc_id
  vpc_public_subnets = module.vpc.vpc_public_subnets
  s3_dynamodb_profile_name = module.iam.s3_dynamodb_profile_name
  app_bucket_bucket = module.s3.app_bucket_bucket
  load_balancer_sg_id = module.alb.load_balancer_sg_id
  app_launch_template_name = "${var.app_launch_template_name}-${var.env}"
  app_launch_template_image_id = var.app_launch_template_image_id
  app_launch_template_instance_type = var.app_launch_template_instance_type
  tags = var.common_tags
}

module "autoscaling" {
  source = "./modules/autoscaling"
  autoscaling_group_name = "${var.autoscaling_group_name}-${var.env}"
  autoscaling_group_max_size = var.autoscaling_group_max_size
  autoscaling_group_min_size = var.autoscaling_group_min_size
  autoscaling_group_desired_capacity = var.autoscaling_group_desired_capacity
  autoscaling_group_health_check_grace_period = var.autoscaling_group_health_check_grace_period
  autoscaling_policy_name = "${var.autoscaling_policy_name}-${var.env}"
  autoscaling_policy_target_value = var.autoscaling_policy_target_value
  autoscaling_sns_topic_name = "${var.autoscaling_sns_topic_name}-${var.env}"
  autoscaling_notifications = var.autoscaling_notifications
  autoscaling_notifications_email = var.autoscaling_notifications_email
  app_launch_template_id = module.ec2.app_launch_template_id
  vpc_public_subnets = module.vpc.vpc_public_subnets
  app_target_group_arns = [module.alb.load_balancer_target_group_arn]
}
