variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment (source/target)"
  type        = string
}

variable "bucket_names" {
  description = "List of S3 bucket names"
  type = object({
    dev_unretired_fe     = string
    fe_dev_unretired     = string
    front_dev_unretired  = string
    unretired_dev_abs    = string
    unretired_dev_mp4    = string
    unretired_dev_origin = string
    unretired_prod_abs   = string
  })
  default = {
    dev_unretired_fe     = "dev-unretired-fe"
    fe_dev_unretired     = "fe-dev-unretired"
    front_dev_unretired  = "front-dev-unretired"
    unretired_dev_abs    = "unretired-dev-abs"
    unretired_dev_mp4    = "unretired-dev-mp4"
    unretired_dev_origin = "unretired-dev-origin"
    unretired_prod_abs   = "unretired-prod-abs"
  }
}
