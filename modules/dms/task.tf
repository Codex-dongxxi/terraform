resource "aws_dms_replication_task" "main" {
  replication_task_id          = "${var.project_name}-task"
  replication_instance_arn     = aws_dms_replication_instance.main.replication_instance_arn
  source_endpoint_arn          = aws_dms_endpoint.source.endpoint_arn
  target_endpoint_arn          = aws_dms_endpoint.target.endpoint_arn
  migration_type               = "full-load-and-cdc"
  table_mappings               = file("${path.module}/table-mappings.json")
  replication_task_settings    = file("${path.module}/replication-settings.json")
  start_replication_task       = true
}
