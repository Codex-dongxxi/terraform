resource "aws_dms_replication_subnet_group" "main" {
  replication_subnet_group_id = "${var.project_name}-dms-subnet"
  subnet_ids                  = var.subnet_ids
  tags = {
    Name = "${var.project_name}-dms-subnet"
  }
}
