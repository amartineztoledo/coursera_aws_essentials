output "load_balancer_sg_id" {
  description = "Load Balancer Security Group Id"
  value = aws_security_group.load_balancer_sg.id
}

output "load_balancer_target_group_arn" {
  description = "Target Group ARN"
  value = aws_lb_target_group.load_balancer_target_group.arn
}