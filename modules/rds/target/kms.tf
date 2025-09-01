resource "aws_kms_key" "rds" {
  provider                = aws.target
  description             = "KMS for ${var.project_name} RDS"
  deletion_window_in_days = 7
}
resource "aws_kms_alias" "rds" {
  provider      = aws.target
  name          = "alias/${var.project_name}-rds"
  target_key_id = aws_kms_key.rds.key_id
}

output "kms_arn" { value = aws_kms_key.rds.arn }
