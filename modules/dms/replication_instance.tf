resource "aws_dms_replication_instance" "main" {
  replication_instance_id     = "${var.project_name}-dms"
  replication_instance_class  = "dms.t3.medium"
  allocated_storage           = 100
  # Use the DMS security group from the target account
  vpc_security_group_ids      = ["sg-target-dms-yyyy"]
  replication_subnet_group_id = aws_dms_replication_subnet_group.main.id
  publicly_accessible         = false
  auto_minor_version_upgrade  = true
  apply_immediately           = true
  tags = {
    Name = "${var.project_name}-dms"
  }
}
