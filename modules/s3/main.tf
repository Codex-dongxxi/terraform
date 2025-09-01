# S3 Buckets for Unretired Video Streaming Platform

# Development Frontend Buckets
resource "aws_s3_bucket" "dev_unretired_fe" {
  bucket = "dev-unretired-fe"

  tags = {
    Name        = "dev-unretired-fe"
    Environment = "development"
    Purpose     = "frontend"
  }
}

resource "aws_s3_bucket" "fe_dev_unretired" {
  bucket = "fe-dev-unretired"

  tags = {
    Name        = "fe-dev-unretired"
    Environment = "development"
    Purpose     = "frontend"
  }
}

resource "aws_s3_bucket" "front_dev_unretired" {
  bucket = "front-dev-unretired"

  tags = {
    Name        = "front-dev-unretired"
    Environment = "development"
    Purpose     = "frontend"
  }
}

# Development Video Storage
resource "aws_s3_bucket" "unretired_dev_abs" {
  bucket = "unretired-dev-abs"

  tags = {
    Name        = "unretired-dev-abs"
    Environment = "development"
    Purpose     = "hls-streaming"
  }
}

resource "aws_s3_bucket" "unretired_dev_mp4" {
  bucket = "unretired-dev-mp4"

  tags = {
    Name        = "unretired-dev-mp4"
    Environment = "development"
    Purpose     = "mp4-files"
  }
}

resource "aws_s3_bucket" "unretired_dev_origin" {
  bucket = "unretired-dev-origin"

  tags = {
    Name        = "unretired-dev-origin"
    Environment = "development"
    Purpose     = "origin-files"
  }
}

# Production Video Storage
resource "aws_s3_bucket" "unretired_prod_abs" {
  bucket = "unretired-prod-abs"

  tags = {
    Name        = "unretired-prod-abs"
    Environment = "production"
    Purpose     = "hls-streaming"
  }
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "dev_unretired_fe" {
  bucket = aws_s3_bucket.dev_unretired_fe.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "front_dev_unretired" {
  bucket = aws_s3_bucket.front_dev_unretired.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Public Access Block (보안을 위해 기본적으로 차단)
resource "aws_s3_bucket_public_access_block" "dev_unretired_fe" {
  bucket = aws_s3_bucket.dev_unretired_fe.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "front_dev_unretired" {
  bucket = aws_s3_bucket.front_dev_unretired.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "unretired_dev_abs" {
  bucket = aws_s3_bucket.unretired_dev_abs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "unretired_dev_mp4" {
  bucket = aws_s3_bucket.unretired_dev_mp4.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "unretired_dev_origin" {
  bucket = aws_s3_bucket.unretired_dev_origin.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "unretired_prod_abs" {
  bucket = aws_s3_bucket.unretired_prod_abs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# CORS Configuration for video streaming
resource "aws_s3_bucket_cors_configuration" "unretired_dev_abs" {
  bucket = aws_s3_bucket.unretired_dev_abs.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_cors_configuration" "unretired_prod_abs" {
  bucket = aws_s3_bucket.unretired_prod_abs.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}
