output "bastion_instance_id" {
  description = "Bastion instance ID"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Bastion public IP"
  value       = aws_eip.bastion.public_ip
}

output "dev_instance_id" {
  description = "Development instance ID"
  value       = aws_instance.dev.id
}

output "dev_private_ip" {
  description = "Development instance private IP"
  value       = aws_instance.dev.private_ip
}

output "prod_instance_id" {
  description = "Production instance ID"
  value       = aws_instance.prod.id
}

output "prod_private_ip" {
  description = "Production instance private IP"
  value       = aws_instance.prod.private_ip
}

output "alb_arn" {
  description = "ALB ARN"
  value       = aws_lb.main.arn
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.main.dns_name
}

output "alb_zone_id" {
  description = "ALB zone ID"
  value       = aws_lb.main.zone_id
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = aws_lb_target_group.main.arn
}
