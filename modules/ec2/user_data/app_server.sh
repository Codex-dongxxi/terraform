#!/bin/bash
yum update -y

# Install Docker
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Java 17
yum install -y java-17-amazon-corretto

# Install Node.js
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# Install CloudWatch agent
yum install -y amazon-cloudwatch-agent

# Install SSM agent
yum install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

# Create application directory
mkdir -p /opt/unretired
chown ec2-user:ec2-user /opt/unretired

# Environment specific setup
echo "Environment: ${environment}" > /opt/unretired/environment.txt
