resource "aws_secretsmanager_secret" "src" {
  provider    = aws.target  # store secret in target account
  name        = "${var.project_name}-src-db"
  description = "Source DB secret for ${var.project_name}"
}

resource "aws_secretsmanager_secret_version" "src" {
  provider      = aws.target  # ensure values written to target secret
  secret_id     = aws_secretsmanager_secret.src.id
  secret_string = jsonencode({
    username = var.src_username
    password = var.src_password
  })
}

resource "aws_secretsmanager_secret" "tgt" {
  provider    = aws.target  # store secret in target account
  name        = "${var.project_name}-tgt-db"
  description = "Target DB secret for ${var.project_name}"
}

resource "aws_secretsmanager_secret_version" "tgt" {
  provider      = aws.target  # ensure values written to target secret
  secret_id     = aws_secretsmanager_secret.tgt.id
  secret_string = jsonencode({
    username = var.tgt_username
    password = var.tgt_password
  })
}
