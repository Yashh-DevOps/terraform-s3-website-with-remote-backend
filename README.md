# Terraform S3 Static Website with Remote Backend

A modular Terraform project that deploys a static website on AWS S3 and implements a remote backend using Amazon S3 for state storage and DynamoDB for state locking.

---

## 🚀 Features

- Modular Terraform architecture
- AWS S3 Static Website Hosting
- Remote Backend Configuration
- Terraform State Locking using DynamoDB
- S3 Bucket Versioning
- Server-Side Encryption
- Public Access Configuration for Website Hosting
- Dynamic File Upload using `fileset()`
- Reusable Terraform Modules
- Outputs for important resources

---

## 🏗️ Architecture

```text
                       ┌─────────────────┐
                       │   Terraform     │
                       │   Root Module   │
                       └────────┬────────┘
                                │
               ┌────────────────┴────────────────┐
               │                                 │
               ▼                                 ▼
     ┌─────────────────┐              ┌─────────────────┐
     │ Remote Backend  │              │ Static Website  │
     │     Module      │              │     Module      │
     └────────┬────────┘              └────────┬────────┘
              │                                │
              ▼                                ▼
     ┌─────────────────┐             ┌─────────────────┐
     │   S3 Bucket      │             │   S3 Bucket     │
     │ (Terraform State)│             │ (Website Files) │
     └─────────────────┘             └─────────────────┘
              │                                │
              ▼                                ▼
     ┌─────────────────┐             ┌─────────────────┐
     │ DynamoDB Table  │             │ Static Website  │
     │ (State Locking) │             │   Endpoint      │
     └─────────────────┘             └─────────────────┘
```

---

## 📂 Project Structure

```text
terraform/
├── backend.tf
├── main.tf
├── output.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars.example
├── README.md
│
├── modules/
│   ├── remote_backend/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   │
│   └── s3_static_website/
│       ├── locals.tf
│       ├── output.tf
│       ├── s3_bucket.tf
│       └── variables.tf
│
└── static_website/
    ├── index.html
    ├── error.html
    └── style.css
```

---

## 🛠️ Technologies Used

- Terraform
- AWS S3
- AWS DynamoDB
- Infrastructure as Code (IaC)

---

## 📋 Prerequisites

- AWS Account
- AWS CLI Configured
- IAM User with appropriate permissions

---

## ⚙️ Configure AWS CLI

```bash
aws configure
```

Enter:

```text
AWS Access Key ID
AWS Secret Access Key
Default region: ap-south-1
Output format: json
```

---

## 🚀 Deployment Steps

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/terraform-s3-static-website-with-remote-backend.git
cd terraform-s3-static-website-with-remote-backend
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Validate Configuration

```bash
terraform validate
```

---

### 4. Review Execution Plan

```bash
terraform plan
```

---

### 5. Deploy Infrastructure

```bash
terraform apply
```

---

### 6. Destroy Infrastructure

```bash
terraform destroy
```
"change the variable names as per your need"
---

## 📦 Modules

### 1. Remote Backend Module

Creates:

- S3 Bucket for Terraform State
- Bucket Versioning
- Server-Side Encryption
- Public Access Block
- DynamoDB Table for State Locking

---

### 2. Static Website Module

Creates:

- S3 Bucket
- Website Configuration
- Bucket Policy
- Dynamic File Upload
- Website Endpoint

---

## 📤 Outputs

After deployment, Terraform provides:

| Output              | Description                 | 
|---------------------|-----------------------------|
| state_bucket_name   | Terraform state bucket name |
| state_bucket_arn    | Terraform state bucket ARN  |
| lock_table_name     | DynamoDB table name         |
| website_bucket_name | Static website bucket name  |
| website_bucket_arn  | Static website bucket ARN   |
| website_endpoint    | S3 website endpoint         |

---

## 🔒 Remote Backend Configuration

```hcl
terraform {
  backend "s3" {
    bucket         = "remote-backend-state-bucket-v1"
    key            = "s3-website/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-remote-backend-lock-table"
    encrypt        = true
  }
}
```

---

## 💡 Terraform Concepts Demonstrated

- Terraform Modules
- Variables
- Outputs
- Locals
- Remote Backend
- State Locking
- Dynamic Blocks
- S3 Static Website Hosting
- Infrastructure as Code Best Practices

---

## 🎯 Learning Outcomes

This project helped me understand:

- Terraform project structure
- Remote backend implementation
- State management and locking
- Modular infrastructure design
- AWS S3 static website hosting
- Dynamic file uploads using Terraform

---

## 🏷️ Tags

`terraform` `aws` `s3` `dynamodb` `remote-backend` `iac` `devops` `terraform-modules` `static-website`

---

## 👨‍💻 Author

**Yash Soni**

- MCA Student
- DevOps Enthusiast
- Learning Infrastructure as Code, AWS, Kubernetes, and other tools.

---

⭐ If you found this project helpful, consider giving it a star!