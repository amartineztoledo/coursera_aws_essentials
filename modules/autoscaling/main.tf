resource "aws_autoscaling_group" "app_autosacling_group" {
  name = var.autoscaling_group_name
  launch_template {
    id = var.app_launch_template_id
    version = "$Latest"
  }

  min_size = var.autoscaling_group_min_size
  max_size = var.autoscaling_group_max_size
  desired_capacity = var.autoscaling_group_desired_capacity
  vpc_zone_identifier = var.vpc_public_subnets
  target_group_arns = var.app_target_group_arns

  health_check_type = "ELB"
  health_check_grace_period = var.autoscaling_group_health_check_grace_period
}

resource "aws_autoscaling_policy" "app_autoscaling_policy" {
  name = var.autoscaling_policy_name
  autoscaling_group_name = aws_autoscaling_group.app_autosacling_group.name
  policy_type = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.autoscaling_policy_target_value
  }
}

resource "aws_sns_topic" "app_sns_topic" {
  name = var.autoscaling_sns_topic_name
}

resource "aws_autoscaling_notification" "app_autoscaling_notifications" {
  group_names = [aws_autoscaling_group.app_autosacling_group.name]
  notifications = var.autoscaling_notifications
  topic_arn = aws_sns_topic.app_sns_topic.arn
}

resource "aws_sns_topic_subscription" "app_sns_topic_subscription" {
  topic_arn = aws_sns_topic.app_sns_topic.arn
  protocol = "email"
  endpoint = var.autoscaling_notifications_email
}