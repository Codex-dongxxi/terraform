resource "aws_dms_replication_subnet_group" "main" {
  replication_subnet_group_id = "${var.project_name}-dms-subnet"
  # Target account private subnets for DMS instance
  subnet_ids                  = [
    "subnet-aaaaaaaaaaaaaaaaa", # ap-northeast-2a
    "subnet-bbbbbbbbbbbbbbbbb"  # ap-northeast-2c
  ]
  tags = {
    Name = "${var.project_name}-dms-subnet"
  }
}
