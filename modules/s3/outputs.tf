output "bucket_names" {
  description = "S3 bucket names"
  value = {
    dev_unretired_fe     = aws_s3_bucket.dev_unretired_fe.id
    fe_dev_unretired     = aws_s3_bucket.fe_dev_unretired.id
    front_dev_unretired  = aws_s3_bucket.front_dev_unretired.id
    unretired_dev_abs    = aws_s3_bucket.unretired_dev_abs.id
    unretired_dev_mp4    = aws_s3_bucket.unretired_dev_mp4.id
    unretired_dev_origin = aws_s3_bucket.unretired_dev_origin.id
    unretired_prod_abs   = aws_s3_bucket.unretired_prod_abs.id
  }
}

output "bucket_arns" {
  description = "S3 bucket ARNs"
  value = {
    dev_unretired_fe     = aws_s3_bucket.dev_unretired_fe.arn
    fe_dev_unretired     = aws_s3_bucket.fe_dev_unretired.arn
    front_dev_unretired  = aws_s3_bucket.front_dev_unretired.arn
    unretired_dev_abs    = aws_s3_bucket.unretired_dev_abs.arn
    unretired_dev_mp4    = aws_s3_bucket.unretired_dev_mp4.arn
    unretired_dev_origin = aws_s3_bucket.unretired_dev_origin.arn
    unretired_prod_abs   = aws_s3_bucket.unretired_prod_abs.arn
  }
}

output "bucket_domain_names" {
  description = "S3 bucket domain names"
  value = {
    dev_unretired_fe     = aws_s3_bucket.dev_unretired_fe.bucket_domain_name
    fe_dev_unretired     = aws_s3_bucket.fe_dev_unretired.bucket_domain_name
    front_dev_unretired  = aws_s3_bucket.front_dev_unretired.bucket_domain_name
    unretired_dev_abs    = aws_s3_bucket.unretired_dev_abs.bucket_domain_name
    unretired_dev_mp4    = aws_s3_bucket.unretired_dev_mp4.bucket_domain_name
    unretired_dev_origin = aws_s3_bucket.unretired_dev_origin.bucket_domain_name
    unretired_prod_abs   = aws_s3_bucket.unretired_prod_abs.bucket_domain_name
  }
}
