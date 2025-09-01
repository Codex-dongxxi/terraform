resource "aws_db_instance" "main" {
  provider               = aws.target
  identifier             = "${var.project_name}-rds"
  engine                 = "mysql"
  engine_version         = "8.0.40"
  instance_class         = var.instance_class

  allocated_storage      = var.allocated_storage
  max_allocated_storage  = 100
  storage_type           = "gp3"
  storage_encrypted      = true
  kms_key_id             = var.kms_arn

  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.vpc_security_group_ids
  publicly_accessible    = false
  port                   = var.port

  parameter_group_name   = "default.mysql8.0"
  option_group_name      = "default:mysql-8-0"

  skip_final_snapshot = true
  apply_immediately  = true

  tags = {
    Name = "${var.project_name}-rds"
  }
}
