# modules/rds/source/parameter_group.tf
resource "aws_db_parameter_group" "mysql80_cdc" {
  provider    = aws.source
  name        = "${var.project_name}-mysql80-cdc"
  family      = "mysql8.0"
  description = "CDC for DMS"

  parameter {
    name  = "binlog_format"
    value = "ROW"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "binlog_row_image"
    value = "FULL"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "binlog_checksum"
    value = "NONE"
    apply_method = "pending-reboot"
  }
}

output "cdc_parameter_group_name" {
  value = aws_db_parameter_group.mysql80_cdc.name
}
