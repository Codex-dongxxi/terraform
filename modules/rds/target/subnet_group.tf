resource "aws_db_subnet_group" "this" {
  provider   = aws.target
  name       = "${var.project_name}-db-subnet"
  subnet_ids = var.db_subnet_ids
  tags = { Name = "${var.project_name}-db-subnet" }
}
output "db_subnet_group_name" { value = aws_db_subnet_group.this.name }
