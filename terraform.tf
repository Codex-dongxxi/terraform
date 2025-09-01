terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # 백엔드 설정은 환경별로 다르게 구성
    # terraform init -backend-config=environments/target/backend.conf
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "target"
  
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

provider "aws" {
  alias   = "source"
  region  = var.aws_region
  profile = "source"
}

provider "aws" {
  alias   = "target"
  region  = var.aws_region
  profile = "target"
}
