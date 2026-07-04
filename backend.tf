terraform {
  backend "s3" {
    bucket         = "remote-backend-state-bucket-v1"
    key            = "s3-website/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-remote-backend-lock-table"
    encrypt        = true
  }
}
