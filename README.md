# 🚀 AWS Infrastructure using Terraform

## 📌 Project Overview
This project provisions a scalable AWS infrastructure using Terraform with a modular approach. It includes networking, compute, storage, database, and monitoring components.

## 🏗️ Architecture
- VPC with public, private, and database subnets
- Internet Gateway & NAT Gateway
- Route Tables
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG) with EC2 instances
- Standalone EC2 instance (optional)
- RDS MySQL database (private)
- S3 bucket
- IAM role and instance profile
- SNS + CloudWatch alerts
- EKS cluster with node group

## 🧰 AWS Services Used
- VPC
- EC2 (ASG + optional standalone)
- Auto Scaling
- ALB
- RDS (MySQL)
- S3
- IAM
- SNS
- CloudWatch
- Amazon EKS (Kubernetes)

## 📁 Project Structure
```text
TERRAFORM-PROJECT/
├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── README.md
└── modules/
    ├── vpc/
    ├── iam/
    ├── alb/
    ├── asg/
    ├── rds/
    ├── s3/
    ├── monitoring/
    ├── eks/
    └── ec2/
```

## ⚙️ Features
- Modular Terraform code
- High availability using ALB + ASG
- Private subnet architecture
- Automated EC2 setup using user_data
- IAM security configuration
- Monitoring using SNS & CloudWatch

## 🚀 How to Deploy
```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## ⚠️ Important Notes
- Use correct AMI for your region
- Ensure EC2 key pair exists
- Change S3 bucket name if already exists
- Do not commit passwords

## 🧹 Cleanup
```bash
terraform destroy
```

## 👨‍💻 Author
Harish  
GitHub: https://github.com/HarishGit08  
LinkedIn: https://www.linkedin.com/in/korapatiharish/