resource "aws_secretsmanager_secret" "src" {
  provider    = aws.target
  name        = "${var.project_name}-src-db"
  description = "Source DB secret for ${var.project_name}"
}

resource "aws_secretsmanager_secret_version" "src" {
  provider      = aws.target
  secret_id     = aws_secretsmanager_secret.src.id
  secret_string = jsonencode({
    username = var.src_username
    password = var.src_password
  })
}

resource "aws_secretsmanager_secret" "tgt" {
  provider    = aws.target
  name        = "${var.project_name}-tgt-db"
  description = "Target DB secret for ${var.project_name}"
}

resource "aws_secretsmanager_secret_version" "tgt" {
  provider      = aws.target
  secret_id     = aws_secretsmanager_secret.tgt.id
  secret_string = jsonencode({
    username = var.tgt_username
    password = var.tgt_password
  })
}
