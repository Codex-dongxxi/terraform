output "dms_instance_id" {
  value = aws_dms_replication_instance.main.id
}

output "dms_instance_arn" {
  value = aws_dms_replication_instance.main.replication_instance_arn
}

output "dms_task_id" {
  value = aws_dms_replication_task.main.replication_task_id
}
