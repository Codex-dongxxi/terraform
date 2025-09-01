# Target Environment (B계정 - 새 계정)
environment = "target"

# Network Configuration
vpc_cidr               = "10.0.0.0/16"
availability_zones     = ["ap-northeast-2a", "ap-northeast-2c"]
public_subnet_cidrs    = ["10.0.0.0/20", "10.0.16.0/20"]
private_subnet_cidrs   = ["10.0.128.0/20", "10.0.32.0/20"]

# EC2 Configuration
key_name = "unretired-dev"  # B계정에서 새로 생성 필요

# RDS Configuration
db_username = "admin"
# db_password는 별도로 설정 필요

# Domain Configuration
domain_name = "unretired.co.kr"
# === 추가: RDS/DMS Migration 관련 =======================

project_name = "unretired"

tgt_db_subnet_ids = [
  "subnet-aaaaaaaaaaaaaaaaa",  # ap-northeast-2a
  "subnet-bbbbbbbbbbbbbbbbb"   # ap-northeast-2c
]

# 타깃 RDS 보안그룹 (DMS SG에서 3306 인바운드 허용 필요)
tgt_db_sg_ids = ["sg-target-rds-xxxx"]

# DMS 인스턴스 보안그룹 (아웃바운드 허용, 소스 RDS로 3306 접근 가능해야 함)
tgt_dms_sg_ids = ["sg-target-dms-yyyy"]

# 소스 RDS(기존 계정)
src_endpoint  = "unretired-rds.c5o64ekyqojn.ap-northeast-2.rds.amazonaws.com"
src_db_name   = "unretired"
src_username  = "admin"
# src_password는 secrets.auto.tfvars 또는 환경변수로 주입 권장

# 타깃 RDS
tgt_db_name   = "unretired"
tgt_username  = "admin"
# tgt_password도 secrets.auto.tfvars 또는 환경변수로 주입 권장
# =======================================================
