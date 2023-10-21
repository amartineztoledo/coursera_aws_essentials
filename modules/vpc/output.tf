output "vpc_id" {
  description = "VPC ID"
  value = module.vpc.vpc_id
}

output "vpc_public_subnets" {
  description = "VPC public subnets"
  value = module.vpc.public_subnets
}
