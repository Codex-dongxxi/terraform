# Source Environment (A계정 - 913524915414)
environment = "source"

# Network Configuration
vpc_cidr               = "10.0.0.0/16"
availability_zones     = ["ap-northeast-2a", "ap-northeast-2c"]
public_subnet_cidrs    = ["10.0.0.0/20", "10.0.16.0/20"]
private_subnet_cidrs   = ["10.0.128.0/20", "10.0.32.0/20"]

# EC2 Configuration
key_name = "unretired-dev"

# RDS Configuration
db_username = "admin"
# db_password는 별도로 설정 필요

# Domain Configuration
domain_name = "unretired.co.kr"