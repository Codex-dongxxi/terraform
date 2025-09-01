resource "aws_db_instance" "main" {
  identifier = "${var.project_name}-rds"
  engine = "mysql"
  engine_version = "8.0.40"
  instance_class = var.instance_class

  allocated_storage = 20
  max_allocated_storage = 100
  storage_type = "gp3"
  storage_encrypted = true

  db_name = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = var.security_group_ids
  publicly_accessible = false
  port = var.port

  parameter_group_name = "default.mysql8.0"
  option_group_name = "default:mysql-8-0"

  skip_final_snapshot = true
  apply_immediately = true

  tags = {
    Name = "${var.project_name}-rds"
  }
}

resource "aws_db_subnet_group" "main" {
  name = "${var.project_name}-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-subnet-group"
  }
}
