# Security Group for ALB
resource "aws_security_group" "load_balancer_sg" {
  name = var.load_balancer_sg_name
  description = "HTTP access"
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

# Target Group
resource "aws_lb_target_group" "load_balancer_target_group" {
  name = var.load_balancer_target_group_name
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 5
    timeout = 30
    interval = 40
    protocol = "HTTP"
    path = "/"
  }

  tags = var.common_tags
}

# ALB
resource "aws_lb" "app_alb" {
  name = var.load_balancer_name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.load_balancer_sg.id]
  enable_deletion_protection = false
  subnets = var.vpc_public_subnets

  enable_cross_zone_load_balancing = true

  tags = var.common_tags
}

# ALB Listener
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  }
}