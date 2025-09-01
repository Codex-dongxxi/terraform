variable "project_name" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_subnet_ids" {
  type = list(string)
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "instance_class" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "kms_arn" {
  type    = string
  default = null
}

variable "port" {
  type    = number
  default = 3306
}
