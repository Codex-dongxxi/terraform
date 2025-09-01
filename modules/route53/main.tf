# Route53 Hosted Zone
resource "aws_route53_zone" "main" {
  name    = var.domain_name
  comment = "Hosted zone for ${var.domain_name}"

  tags = {
    Name = var.domain_name
  }
}

# Root domain A record (GitHub Pages)
resource "aws_route53_record" "root_a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300

  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
}

# MX records for email
resource "aws_route53_record" "mx" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "MX"
  ttl     = 300

  records = [
    "1 ASPMX.L.GOOGLE.COM.",
    "5 ALT1.ASPMX.L.GOOGLE.COM.",
    "5 ALT2.ASPMX.L.GOOGLE.COM.",
    "10 ALT3.ASPMX.L.GOOGLE.COM.",
    "10 ALT4.ASPMX.L.GOOGLE.COM."
  ]
}

# TXT record for Google site verification
resource "aws_route53_record" "google_verification" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "TXT"
  ttl     = 300

  records = [
    "google-site-verification=Xjop5ATVqig58MIA_JWrLGLAi9a0euIThiRFAOoanJQ"
  ]
}

# ACM validation records
resource "aws_route53_record" "acm_validation_root" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "_86ea1dcb79a2868c45b0fcf07dcf267d.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300

  records = [
    "_88d18002894476343fffe7dbc5c7bc7a.xlfgrmvvlj.acm-validations.aws."
  ]
}

resource "aws_route53_record" "acm_validation_dev" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "_6c1604354e580ab1496210707c83e2e6.dev.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300

  records = [
    "_7807b74807761b34e655da903fe96f27.zfyfvmchrl.acm-validations.aws."
  ]
}

# API subdomain (ALB)
resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = false
  }
}

# Dev subdomain (ALB)
resource "aws_route53_record" "dev" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "dev.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = false
  }
}

# CDN subdomain (CloudFront)
resource "aws_route53_record" "cdn_a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "cdn.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_cdn_domain_name
    zone_id                = "Z2FDTNDATAQYW2"  # CloudFront hosted zone ID
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cdn_aaaa" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "cdn.${var.domain_name}"
  type    = "AAAA"

  alias {
    name                   = var.cloudfront_cdn_domain_name
    zone_id                = "Z2FDTNDATAQYW2"  # CloudFront hosted zone ID
    evaluate_target_health = false
  }
}

# WWW subdomain (CloudFront)
resource "aws_route53_record" "www_a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_frontend_domain_name
    zone_id                = "Z2FDTNDATAQYW2"  # CloudFront hosted zone ID
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_aaaa" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "AAAA"

  alias {
    name                   = var.cloudfront_frontend_domain_name
    zone_id                = "Z2FDTNDATAQYW2"  # CloudFront hosted zone ID
    evaluate_target_health = false
  }
}

# Dev Frontend subdomain (CloudFront)
resource "aws_route53_record" "front_dev_a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "front.dev.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_dev_frontend_domain_name
    zone_id                = "Z2FDTNDATAQYW2"  # CloudFront hosted zone ID
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "front_dev_aaaa" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "front.dev.${var.domain_name}"
  type    = "AAAA"

  alias {
    name                   = var.cloudfront_dev_frontend_domain_name
    zone_id                = "Z2FDTNDATAQYW2"  # CloudFront hosted zone ID
    evaluate_target_health = false
  }
}
