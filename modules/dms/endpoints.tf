resource "aws_dms_endpoint" "source" {
  endpoint_id = "${var.project_name}-src"
  endpoint_type = "source"
  engine_name = "mysql"
  username = var.src_username
  password = var.src_password
  # Actual source RDS endpoint
  server_name = "unretired-rds.c5o64ekyqojn.ap-northeast-2.rds.amazonaws.com"
  database_name = var.src_db_name
  port = 3306
}

resource "aws_dms_endpoint" "target" {
  endpoint_id = "${var.project_name}-tgt"
  endpoint_type = "target"
  engine_name = "mysql"
  username = var.tgt_username
  password = var.tgt_password
  # Actual target RDS endpoint
  server_name = "unretired-target-rds.c5o64ekyqojn.ap-northeast-2.rds.amazonaws.com"
  database_name = var.tgt_db_name
  port = 3306
}
