variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "private_route_table_ids" {
  description = "Private route table IDs"
  type        = list(string)
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}

variable "nat_instance_sg_id" {
  description = "NAT Instance Security Group ID"
  type        = string
}

variable "bastion_sg_id" {
  description = "Bastion Security Group ID"
  type        = string
}

variable "bastion_tg_sg_id" {
  description = "Bastion Target Group Security Group ID"
  type        = string
}

variable "ec2_rds_sg_id" {
  description = "EC2 to RDS Security Group ID"
  type        = string
}

variable "rds_ec2_sg_id" {
  description = "RDS from EC2 Security Group ID"
  type        = string
}

variable "alb_sg_id" {
  description = "ALB Security Group ID"
  type        = string
}
