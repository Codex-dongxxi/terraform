variable "project_name" {
  description = "Project name prefix"
  type = string
}

variable "db_name" {
  description = "DB name"
  type = string
}

variable "db_username" {
  description = "Master username"
  type = string
}

variable "db_password" {
  description = "Master password"
  type = string
  sensitive = true
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for DB subnet group"
  type = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for RDS"
  type = list(string)
}

variable "port" {
  description = "DB port"
  type = number
  default = 3306
}