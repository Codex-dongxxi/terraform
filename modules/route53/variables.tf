variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "unretired.co.kr"
}

variable "alb_dns_name" {
  description = "ALB DNS name"
  type        = string
}

variable "alb_zone_id" {
  description = "ALB hosted zone ID"
  type        = string
}

variable "cloudfront_cdn_domain_name" {
  description = "CloudFront CDN distribution domain name"
  type        = string
}

variable "cloudfront_frontend_domain_name" {
  description = "CloudFront frontend distribution domain name"
  type        = string
}

variable "cloudfront_dev_frontend_domain_name" {
  description = "CloudFront dev frontend distribution domain name"
  type        = string
}
